package gapi

import (
	"context"
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
		CreateAccountParams: db.CreateAccountParams{
			Passwordhash: hashedPassword,
			Email:        req.GetEmail(),
		},
		AfterCreate: func(a db.Account) error {
			return server.mailSender.SendEmail("Verify your E-Mail Address", fmt.Sprintf("Hello %s,</br></br>please verify your E-Mail Addres by clicking on the following link:</br><a href=\"https://df.itsscb.de/v1/verify_email/%d/%s\">Verification Link</a></br></br></br>Your Team of DF", req.GetEmail(), a.ID, a.SecretKey.String), []string{req.GetEmail()}, nil, nil, nil)
		},
	}

	if server.config.Environment == "development" {
		arg.AfterCreate = func(a db.Account) error {
			slog.Info("create_account (verify_account)", slog.String("secret_key", a.SecretKey.String))
			return nil
		}
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

	return violations
}
