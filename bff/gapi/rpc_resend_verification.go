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
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) ResendVerification(ctx context.Context, req *pb.ResendVerificationRequest) (*pb.ResendVerificationResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateResendVerificationRequest(req)
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

	if account.VerificationSent.Time.Add(time.Minute * 5).After(time.Now()) {
		return nil, status.Error(codes.AlreadyExists, "already sent. Only allowed every 5 Minutes")
	}

	arg := db.ResendVerificationTxParams{
		ResendVerificationParams: db.ResendVerificationParams{
			ID: req.GetAccountId(),
		},
		AfterCreate: func(a db.Account) error {
			return server.mailSender.SendEmail("Verify your E-Mail Address", fmt.Sprintf("Hello %s,</br></br>please verify your E-Mail Addres by clicking on the following link:</br><a href=\"http://localhost:8080/v1/verify_email/%d/%s\">Verification Link</a></br></br></br>Your Team of DF", account.Email, a.ID, a.SecretKey.String), []string{account.Email}, nil, nil, nil)
		},
	}

	account, err = server.store.ResendVerificationTx(ctx, arg)
	if err != nil {
		slog.Error("resend_verification (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to resend verification")
	}

	rsp := &pb.ResendVerificationResponse{
		Account: convertAccount(account),
	}

	return rsp, nil
}

func validateResendVerificationRequest(req *pb.ResendVerificationRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("account_id", errors.New("must be greater than 0")))
	}

	return violations
}
