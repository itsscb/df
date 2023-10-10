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

func (server *Server) GetPerson(ctx context.Context, req *pb.GetPersonRequest) (*pb.GetPersonResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateGetPersonRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("get_person (get_account)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	person, err := server.store.GetPerson(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "no persons found")
		}
		slog.Error("get_person (get_person)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.NotFound, "failed to get persons")
	}

	if account.ID != person.AccountID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	rsp := &pb.GetPersonResponse{
		Person: convertPerson(person),
	}

	return rsp, nil
}

func validateGetPersonRequest(req *pb.GetPersonRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	return violations
}
