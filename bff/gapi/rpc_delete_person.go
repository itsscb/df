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

func (server *Server) DeletePerson(ctx context.Context, req *pb.DeletePersonRequest) (*pb.DeletePersonResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateDeletePersonRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, authPayload.AccountID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("delete_person (get_account)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	person, err := server.store.GetPerson(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "person not found")
		}
		slog.Error("delete_person (get_person)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to get person")
	}

	if person.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "person not found")
		}
	}

	err = server.store.DeletePersonTx(ctx, person.ID)
	if err != nil {
		slog.Error("delete_person (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to delete person")

	}

	rsp := &pb.DeletePersonResponse{
		Id:      person.ID,
		Deleted: true,
	}
	return rsp, nil
}

func validateDeletePersonRequest(req *pb.DeletePersonRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	return violations
}
