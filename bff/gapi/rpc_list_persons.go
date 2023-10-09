package gapi

import (
	"context"
	"database/sql"
	"errors"

	"github.com/itsscb/df/bff/pb"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) ListPersons(ctx context.Context, req *pb.ListPersonsRequest) (*pb.ListPersonsResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateListPersonsRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	if account.ID != req.GetAccountId() {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	accountID := int64(account.ID)

	dbPersons, err := server.store.ListPersons(ctx, accountID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "no persons found")
		}
		return nil, status.Error(codes.NotFound, "failed to get persons")
	}

	var persons []*pb.Person
	for _, a := range dbPersons {
		persons = append(persons, convertPerson(a))
	}

	rsp := &pb.ListPersonsResponse{
		Persons: persons,
	}

	return rsp, nil
}

func validateListPersonsRequest(req *pb.ListPersonsRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("account_id", errors.New("must be greater than 0")))
	}

	return violations
}
