package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/util"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateAccount(ctx context.Context, req *pb.CreateAccountRequest) (*pb.CreateAccountResponse, error) {
	violations := validateCreateAccountRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	hashedPassword, err := util.HashPassword(req.GetPassword())
	if err != nil {
		slog.Error("create_account (hash_password)", slog.String("invoked_by", req.GetEmail()), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to hash password: %s", err)
	}

	arg := db.CreateAccountTxParams{
		Passwordhash: hashedPassword,
		PrivacyAccepted: sql.NullBool{
			Valid: true,
			Bool:  req.GetPrivacyAccepted(),
		},
		Firstname: req.GetFirstname(),
		Lastname:  req.GetLastname(),
		Birthday:  req.GetBirthday().AsTime(),
		Email:     req.GetEmail(),
		City:      req.GetCity(),
		Zip:       req.GetZip(),
		Street:    req.GetStreet(),
		Country:   req.GetCountry(),
		Creator:   req.GetEmail(),
		Phone: sql.NullString{
			Valid:  req.GetPhone() != "",
			String: req.GetPhone(),
		},
	}

	account, err := server.store.CreateAccountTx(ctx, arg)
	if err != nil {
		slog.Error("create_account (db)", slog.String("invoked_by", req.GetEmail()), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to create account")
	}

	rsp := &pb.CreateAccountResponse{
		Account: convertAccount(account),
	}

	return rsp, nil
}

func validateCreateAccountRequest(req *pb.CreateAccountRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := val.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	if err := val.ValidatePassword(req.GetPassword()); err != nil {
		violations = append(violations, fieldViolation("password", err))
	}

	if err := val.ValidateName(req.GetFirstname()); err != nil {
		violations = append(violations, fieldViolation("first_name", err))
	}

	if err := val.ValidateName(req.GetLastname()); err != nil {
		violations = append(violations, fieldViolation("last_name", err))
	}

	if err := val.ValidateName(req.GetCity()); err != nil {
		violations = append(violations, fieldViolation("city", err))
	}

	if len(req.GetZip()) < 4 {
		violations = append(violations, fieldViolation("zip", errors.New("must be at least 4 characters long")))
	}

	return violations
}
