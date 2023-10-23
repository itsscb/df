package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) UpdateAccountInfo(ctx context.Context, req *pb.UpdateAccountInfoRequest) (*pb.UpdateAccountInfoResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateUpdateAccountInfoRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	if authPayload.AccountID != req.GetAccountId() {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	changer, err := server.store.GetAccount(ctx, authPayload.AccountID)
	if err != nil {
		return nil, status.Error(codes.NotFound, "account not found")
	}

	arg := db.UpdateAccountInfoTxParams{
		AccountID: req.GetAccountId(),
		Changer:   changer.Email,
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

	account_info, err := server.store.UpdateAccountInfoTx(ctx, arg)
	if err != nil {
		slog.Error("update_account (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to update account")
	}

	rsp := &pb.UpdateAccountInfoResponse{
		AccountInfo: convertAccountInfo(account_info),
	}

	return rsp, nil
}

func validateUpdateAccountInfoRequest(req *pb.UpdateAccountInfoRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
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
