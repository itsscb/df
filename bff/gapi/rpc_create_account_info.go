package gapi

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	"log/slog"
	"time"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) CreateAccountInfo(ctx context.Context, req *pb.CreateAccountInfoRequest) (*pb.CreateAccountInfoResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateCreateAccountInfoRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, req.GetAccountId())
	if err != nil {
		slog.Error("create_account_info (get account)", slog.Int64("invoked_by", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	admin := server.isAdmin(ctx, authPayload)

	if authPayload.AccountID != account.ID {
		if !admin {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	if !account.EmailVerified.Bool {
		if !admin {
			return nil, status.Error(codes.Unauthenticated, "account not verified")
		}
	}

	ai, err := server.store.GetAccountInfo(ctx, req.GetAccountId())
	if err == nil {
		fmt.Printf("%#v", ai)
		return nil, status.Error(codes.AlreadyExists, "account_info already exists for this account")
	}

	arg := db.CreateAccountInfoParams{
		AccountID: req.GetAccountId(),
		Firstname: req.GetFirstname(),
		Lastname:  req.GetLastname(),
		Street:    req.GetStreet(),
		City:      req.GetCity(),
		Zip:       req.GetZip(),
		Country:   req.GetCountry(),
		Phone: sql.NullString{
			Valid:  req.GetPhone() != "",
			String: req.GetPhone(),
		},
		Birthday: req.GetBirthday().AsTime(),
		PrivacyAccepted: sql.NullBool{
			Valid: req.PrivacyAccepted != nil,
			Bool:  req.GetPrivacyAccepted(),
		},
		PrivacyAcceptedDate: sql.NullTime{
			Valid: req.PrivacyAccepted != nil,
			Time:  time.Now(),
		},
	}

	account_info, err := server.store.CreateAccountInfo(ctx, arg)
	if err != nil {
		slog.Error("create_account_info (db)", slog.Int64("invoked_by", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to create account info")
	}

	rsp := &pb.CreateAccountInfoResponse{
		AccountInfo: convertAccountInfo(account_info),
	}

	return rsp, nil
}

func validateCreateAccountInfoRequest(req *pb.CreateAccountInfoRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if !val.IsValidName(req.GetFirstname()) {
		violations = append(violations, fieldViolation("firstname", errors.New("invalid input")))
	}
	if !val.IsValidName(req.GetLastname()) {
		violations = append(violations, fieldViolation("lastname", errors.New("invalid input")))
	}
	if !val.IsValidAlphaNumSpace(req.GetStreet()) {
		violations = append(violations, fieldViolation("street", errors.New("invalid input")))
	}
	if !val.IsValidAlphaNumSpace(req.GetZip()) {
		violations = append(violations, fieldViolation("zip", errors.New("invalid input")))
	}
	if !val.IsValidName(req.GetCity()) {
		violations = append(violations, fieldViolation("city", errors.New("invalid input")))
	}
	if !val.IsValidName(req.GetCountry()) {
		violations = append(violations, fieldViolation("country", errors.New("invalid input")))
	}

	return violations
}
