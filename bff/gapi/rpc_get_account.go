package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	"github.com/itsscb/df/bff/pb"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) GetAccount(ctx context.Context, req *pb.GetAccountRequest) (*pb.GetAccountResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateGetAccountRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("get_account (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	accountLevel, err := server.store.GetAccountLevel(ctx, account.ID)
	if err != nil {
		slog.Error("get_account_level (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetId())), slog.String("error", err.Error()))
	}

	rsp := &pb.GetAccountResponse{
		Account: convertAccount(account),
	}

	lvl := uint32(accountLevel.AccountLevel)
	rsp.Account.AccountLevel = &lvl

	return rsp, nil
}

func validateGetAccountRequest(req *pb.GetAccountRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	return violations
}
