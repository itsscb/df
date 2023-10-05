package gapi

import (
	"context"
	"database/sql"
	"errors"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/util"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) Login(ctx context.Context, req *pb.LoginRequest) (*pb.LoginResponse, error) {
	violations := validateLoginRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, req.GetEmail())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "account not found")

		}
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	err = util.CheckPassword(req.GetPassword(), account.Passwordhash)
	if err != nil {
		return nil, status.Error(codes.PermissionDenied, "invalid password")
	}

	accessToken, accessPayload, err := server.tokenMaker.CreateToken(
		account.Email,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create access token")
	}

	refreshToken, refreshPayload, err := server.tokenMaker.CreateToken(
		account.Email,
		server.config.RefreshTokenDuration,
	)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create refresh token")

	}

	mtdt := server.extractMetadata(ctx)

	session, err := server.store.CreateSession(ctx, db.CreateSessionParams{
		ID:           refreshPayload.ID,
		Email:        account.Email,
		RefreshToken: refreshToken,
		UserAgent:    mtdt.UserAgent,
		ClientIp:     mtdt.ClientIP,
		IsBlocked:    false,
		ExpiresAt:    refreshPayload.ExpiredAt,
	})
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to create session")

	}

	rsp := &pb.LoginResponse{
		SessionId:             session.ID.String(),
		AccessToken:           accessToken,
		AccessTokenExpiresAt:  timestamppb.New(accessPayload.ExpiredAt),
		RefreshToken:          refreshToken,
		RefreshTokenExpiresAt: timestamppb.New(refreshPayload.ExpiredAt),
		Email:                 account.Email,
	}
	return rsp, nil
}

func validateLoginRequest(req *pb.LoginRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := val.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	if err := val.ValidatePassword(req.GetPassword()); err != nil {
		violations = append(violations, fieldViolation("password", err))
	}

	return violations
}
