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

func (server *Server) UpdateAccount(ctx context.Context, req *pb.UpdateAccountRequest) (*pb.UpdateAccountResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateUpdateAccountRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	if authPayload.Email != req.GetEmail() {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	arg := db.UpdateAccountTxParams{
		ID:      req.GetId(),
		Changer: authPayload.Email,
		Email: sql.NullString{
			Valid:  req.GetEmail() != "",
			String: req.GetEmail(),
		},
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
		Phone: sql.NullString{
			Valid:  req.GetPhone() != "",
			String: req.GetPhone(),
		},
		Birthday: sql.NullTime{
			Valid: req.GetBirthday().IsValid(),
			Time:  req.GetBirthday().AsTime(),
		},
	}

	if req.Password != nil {
		hashedPassword, err := util.HashPassword(req.GetPassword())
		if err != nil {
			slog.Error("update_account (hash_password)", slog.String("invoked_by", authPayload.Email), slog.Int64("account_id", int64(req.GetId())), slog.String("error", err.Error()))
			return nil, status.Error(codes.Internal, "failed to hash password")
		}

		arg.Passwordhash = sql.NullString{
			Valid:  true,
			String: hashedPassword,
		}
	}

	account, err := server.store.UpdateAccountTx(ctx, arg)
	if err != nil {
		slog.Error("update_account (db)", slog.String("invoked_by", authPayload.Email), slog.Int64("account_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to update account")
	}

	rsp := &pb.UpdateAccountResponse{
		Account: convertAccount(account),
	}

	return rsp, nil
}

func validateUpdateAccountRequest(req *pb.UpdateAccountRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	if req.GetEmail() != "" {
		if err := val.ValidateEmail(req.GetEmail()); err != nil {
			violations = append(violations, fieldViolation("email", err))
		}
	}
	if req.GetPassword() != "" {
		if err := val.ValidatePassword(req.GetPassword()); err != nil {
			violations = append(violations, fieldViolation("password", err))
		}
	}
	if req.GetFirstname() != "" {
		if err := val.ValidateName(req.GetFirstname()); err != nil {
			violations = append(violations, fieldViolation("first_name", err))
		}
	}
	if req.GetLastname() != "" {
		if err := val.ValidateName(req.GetLastname()); err != nil {
			violations = append(violations, fieldViolation("last_name", err))
		}
	}
	if req.GetCity() != "" {
		if err := val.ValidateName(req.GetCity()); err != nil {
			violations = append(violations, fieldViolation("city", err))
		}
	}
	if req.GetZip() != "" {
		if err := val.ValidateName(req.GetZip()); err != nil {
			violations = append(violations, fieldViolation("zip", err))
		}
	}
	if req.GetStreet() != "" {
		if err := val.ValidateStreet(req.GetStreet()); err != nil {
			violations = append(violations, fieldViolation("street", err))
		}
	}

	return violations
}
