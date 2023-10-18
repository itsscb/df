package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"
	"time"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) VerifyEmail(ctx context.Context, req *pb.VerifyEmailRequest) (*pb.VerifyEmailResponse, error) {

	account, err := server.store.GetAccount(ctx, req.GetAccountId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("verify_email (get_account)", slog.Int64("account_id", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if account.ID != req.GetAccountId() {
		return nil, status.Error(codes.NotFound, "account not found")
	}

	if account.SecretKey.String != req.GetSecretKey() {
		return nil, status.Error(codes.NotFound, "unknown secret_key: "+req.GetSecretKey())
	}

	arg := db.VerifyAccountEmailParams{
		ID: account.ID,
		EmailVerified: sql.NullBool{
			Valid: true,
			Bool:  true,
		},
		EmailVerifiedTime: sql.NullTime{
			Valid: true,
			Time:  time.Now(),
		},
	}

	err = server.store.VerifyAccountEmail(ctx, arg)

	rsp := &pb.VerifyEmailResponse{
		Verified: err == nil,
	}
	return rsp, err
}
