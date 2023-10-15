package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) ListAccounts(ctx context.Context, req *pb.ListAccountsRequest) (*pb.ListAccountsResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateListAccountsRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	arg := db.ListAccountsParams{
		Limit:  int32(req.GetPageSize()),
		Offset: int32((req.GetPageId() - 1) * req.GetPageSize()),
	}

	dbAccounts, err := server.store.ListAccounts(ctx, arg)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "no accounts found")
		}
		slog.Error("list_accounts (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int("page_id", int(req.GetPageId())), slog.Int("page_size", int(req.GetPageSize())), slog.String("error", err.Error()))
		return nil, status.Error(codes.NotFound, "failed to get accounts")
	}

	if !server.isAdmin(ctx, authPayload) {
		return nil, status.Error(codes.PermissionDenied, "only for administrators")
	}

	var accounts []*pb.Account
	for _, a := range dbAccounts {
		accounts = append(accounts, convertAccount(a))
	}

	rsp := &pb.ListAccountsResponse{
		Accounts: accounts,
	}

	return rsp, nil
}

func validateListAccountsRequest(req *pb.ListAccountsRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetPageId() < 1 {
		violations = append(violations, fieldViolation("page_id", errors.New("must be greater than 0")))
	}

	if req.GetPageSize() < 5 || req.GetPageId() > 50 {
		violations = append(violations, fieldViolation("page_size", errors.New("must be between 5 and 50")))
	}

	return violations
}
