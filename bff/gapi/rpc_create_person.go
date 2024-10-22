package gapi

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	"log/slog"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreatePerson(ctx context.Context, req *pb.CreatePersonRequest) (*pb.CreatePersonResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateCreatePersonRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, req.GetAccountId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("create_person (get_account)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.NotFound, "failed to get account")
	}

	if authPayload.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	arg := db.CreatePersonTxParams{
		AccountID: account.ID,
		Firstname: req.GetFirstname(),
		Lastname:  req.GetLastname(),
		Birthday:  req.GetBirthday().AsTime(),
		City:      req.GetCity(),
		Street:    req.GetStreet(),
		Country:   req.GetCountry(),
		Relationship: sql.NullString{
			Valid:  req.GetRelationship() != "",
			String: req.GetRelationship(),
		},
		Zip:     req.GetZip(),
		Creator: account.Email,
		Changer: account.Email,
	}

	person, err := server.store.CreatePersonTx(ctx, arg)
	if err != nil {
		slog.Error("create_person (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.String("person", fmt.Sprintf("%s, %s", req.GetLastname(), req.GetFirstname())), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to create person")
	}

	rsp := &pb.CreatePersonResponse{
		Person: convertPerson(person),
	}

	return rsp, nil
}

func validateCreatePersonRequest(req *pb.CreatePersonRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("account_id", errors.New("must be greater than 0")))
	}

	if err := val.ValidateName(req.GetFirstname()); err != nil {
		violations = append(violations, fieldViolation("first_name", err))
	}

	if err := val.ValidateName(req.GetLastname()); err != nil {
		violations = append(violations, fieldViolation("last_name", err))
	}

	if err := val.ValidateAlphaSpace(req.GetCity()); err != nil {
		violations = append(violations, fieldViolation("city", err))
	}

	if err := val.ValidateStreet(req.GetStreet()); err != nil {
		violations = append(violations, fieldViolation("street", err))
	}

	if err := val.ValidateAlphaSpace(req.GetCountry()); err != nil {
		violations = append(violations, fieldViolation("country", err))
	}

	if len(req.GetZip()) < 4 {
		violations = append(violations, fieldViolation("zip", errors.New("must be at least 4 characters long")))
	}

	if req.GetRelationship() != "sole_heir" || req.GetRelationship() != "widow" || req.GetRelationship() != "child" {
		violations = append(violations, fieldViolation("relationship", errors.New("allowed values are: 'sole_heir', 'widow', 'child'")))
	}

	return violations
}
