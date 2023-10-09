package gapi

import (
	"context"
	"database/sql"
	"errors"

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
		return nil, status.Error(codes.NotFound, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	accountID := int64(req.GetAccountId())
	arg := db.CreatePersonTxParams{
		AccountID: accountID,
		Firstname: req.GetFirstname(),
		Lastname:  req.GetLastname(),
		Birthday:  req.GetBirthday().AsTime(),
		City:      req.GetCity(),
		Street:    req.GetStreet(),
		Country:   req.GetCountry(),
		Zip:       req.GetZip(),
		Creator:   authPayload.Email,
		Changer:   authPayload.Email,
	}

	person, err := server.store.CreatePersonTx(ctx, arg)
	if err != nil {
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

	return violations
}
