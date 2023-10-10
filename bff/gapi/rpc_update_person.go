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

func (server *Server) UpdatePerson(ctx context.Context, req *pb.UpdatePersonRequest) (*pb.UpdatePersonResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateUpdatePersonRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("update_person (get_account)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	dbPerson, err := server.store.GetPerson(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "person not found")
		}
		slog.Error("update_person (get_person)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get person")
	}

	if dbPerson.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "person not found")
		}
	}

	arg := db.UpdatePersonParams{
		ID: req.GetId(),
		Firstname: sql.NullString{
			Valid:  req.GetFirstname() != "",
			String: req.GetFirstname(),
		},
		Lastname: sql.NullString{
			Valid:  req.GetLastname() != "",
			String: req.GetLastname(),
		},
		City: sql.NullString{
			Valid:  req.GetCity() != "",
			String: req.GetCity(),
		},
		Zip: sql.NullString{
			Valid:  req.GetZip() != "",
			String: req.GetZip(),
		},
		Street: sql.NullString{
			Valid:  req.GetStreet() != "",
			String: req.GetStreet(),
		},
		Country: sql.NullString{
			Valid:  req.GetCountry() != "",
			String: req.GetCountry(),
		},
		Birthday: sql.NullTime{
			Valid: req.GetBirthday().IsValid(),
			Time:  req.GetBirthday().AsTime(),
		},
		Changer: authPayload.Email,
	}

	person, err := server.store.UpdatePerson(ctx, arg)
	if err != nil {
		slog.Error("update_person (get_person)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to update person")
	}

	rsp := &pb.UpdatePersonResponse{
		Person: convertPerson(person),
	}

	return rsp, nil
}

func validateUpdatePersonRequest(req *pb.UpdatePersonRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	return violations
}
