package gapi

import (
	"context"
	"errors"

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
		Limit:  req.GetPageSize(),
		Offset: (req.GetPageId() - 1) * req.GetPageSize(),
	}

	dbAccounts, err := server.store.ListAccounts(ctx, arg)
	if err != nil {
		return nil, status.Error(codes.NotFound, "failed to get account")
	}

	if !server.isAdmin(ctx, authPayload) {
		return nil, status.Error(codes.PermissionDenied, "only for administrators")
	}

	var accounts []*pb.Account
	for _, a := range dbAccounts {
		accounts = append(accounts, convertAccount(a))
	}

	rsp := &pb.ListAccountsResponse{
		Account: accounts,
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
