package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) AddEmailAddress(ctx context.Context, req *pb.AddEmailAddressRequest) (*pb.AddEmailAddressResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	person, err := server.store.GetPerson(ctx, req.GetPersonId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "person not found")
		}
		slog.Error("add_email (get_person)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("person_id", int64(req.GetPersonId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get person")
	}

	if person.AccountID != authPayload.AccountID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "person not found")
		}
	}

	arg := db.AddEmailAddressParams{
		PersonID: req.GetPersonId(),
		Email:    req.GetEmail(),
	}

	email, err := server.store.AddEmailAddress(ctx, arg)
	if err != nil {
		slog.Error("add_email (write)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("person_id", int64(req.GetPersonId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to insert email")
	}

	response := &pb.AddEmailAddressResponse{
		Email: convertEmail(email),
	}

	return response, err
}
