package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"
	"time"

	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (server *Server) RefreshToken(ctx context.Context, req *pb.RefreshTokenRequest) (*pb.RefreshTokenResponse, error) {
	violations := validateRefreshTokenRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	refreshPayload, err := server.tokenMaker.VerifyToken(req.GetRefreshToken())
	if err != nil {
		return nil, status.Error(codes.PermissionDenied, "invalid session token")

	}

	session, err := server.store.GetSession(ctx, refreshPayload.ID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "session not found")
		}
		slog.Error("refresh_token (get_account)", slog.Int64("invoked_by", int64(refreshPayload.AccountID)), slog.String("refresh_token", req.GetRefreshToken()), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "cannot find session")
	}

	if session.IsBlocked {
		return nil, status.Error(codes.PermissionDenied, "session is blocked")
	}

	if session.AccountID != refreshPayload.AccountID {
		return nil, status.Error(codes.PermissionDenied, "invalid account session")

	}

	if session.RefreshToken != req.RefreshToken {
		return nil, status.Error(codes.PermissionDenied, "mismatched session token")

	}

	if time.Now().After(session.ExpiresAt) {
		return nil, status.Error(codes.PermissionDenied, "session expired")
	}

	accessToken, accessPayload, err := server.tokenMaker.CreateToken(
		refreshPayload.AccountID,
		session.ID,
		server.config.AccessTokenDuration,
	)
	if err != nil {
		slog.Error("refresh_token (access_token)", slog.Int64("invoked_by", int64(refreshPayload.AccountID)), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to create session token")
	}

	rsp := &pb.RefreshTokenResponse{
		AccessToken:          accessToken,
		AccessTokenExpiresAt: timestamppb.New(accessPayload.ExpiredAt),
	}
	return rsp, nil
}

func validateRefreshTokenRequest(req *pb.RefreshTokenRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := val.ValidateString(req.GetRefreshToken(), 200, 400); err != nil {
		violations = append(violations, fieldViolation("refresh_token", err))
	}

	return violations
}
