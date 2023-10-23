package gapi

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
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

	if authPayload.AccountID != req.GetAccountId() {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	_, err = server.store.GetAccount(ctx, req.GetAccountId())
	if err != nil {
		return nil, status.Error(codes.NotFound, "account not found")
	}

	var hashedPassword string
	if req.Password != nil {
		hashedPassword, err = util.HashPassword(req.GetPassword())
		if err != nil {
			slog.Error("create_account (hash_password)", slog.String("invoked_by", req.GetEmail()), slog.String("error", err.Error()))
			return nil, status.Errorf(codes.Internal, "failed to hash password: %s", err)
		}
	}

	arg := db.UpdateAccountTxParams{
		UpdateAccountParams: db.UpdateAccountParams{
			ID: req.GetAccountId(),
			Email: sql.NullString{
				Valid:  req.Email != nil,
				String: req.GetEmail(),
			},
			Passwordhash: sql.NullString{
				Valid:  req.Password != nil,
				String: hashedPassword,
			},
		},
	}

	if req.Email != nil {
		if server.config.Environment == "development" {
			arg.AfterUpdate = func(a db.Account) error {
				slog.Info("update_account (verify_account)", slog.String("secret_key", a.SecretKey.String))
				return nil
			}
		} else {
			arg.AfterUpdate = func(a db.Account) error {
				return server.mailSender.SendEmail("Verify your E-Mail Address", fmt.Sprintf("Hello %s,</br></br>please verify your E-Mail Addres by clicking on the following link:</br><a href=\"http://localhost:8080/v1/verify_email/%d/%s\">Verification Link</a></br></br></br>Your Team of DF", req.GetEmail(), a.ID, a.SecretKey.String), []string{req.GetEmail()}, nil, nil, nil)
			}
		}
	}

	account, err := server.store.UpdateAccountTx(ctx, arg)
	if err != nil {
		slog.Error("update_account (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to update account")
	}

	rsp := &pb.UpdateAccountResponse{
		Account: convertAccount(account),
	}

	return rsp, nil
}

func validateUpdateAccountRequest(req *pb.UpdateAccountRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}
	if err := val.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	if err := val.ValidatePassword(req.GetPassword()); err != nil {
		violations = append(violations, fieldViolation("password", err))
	}

	return violations
}
