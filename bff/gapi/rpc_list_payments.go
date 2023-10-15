package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	"github.com/itsscb/df/bff/pb"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) ListPayments(ctx context.Context, req *pb.ListPaymentsRequest) (*pb.ListPaymentsResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateListPaymentsRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, authPayload.AccountID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("list_payments (get_account)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	if account.ID != req.GetAccountId() {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	dbPayments, err := server.store.ListPayments(ctx, account.ID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "no payments found")
		}
		slog.Error("list_payments (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("account_id", int64(req.GetAccountId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.NotFound, "failed to get payments")
	}

	var payments []*pb.Payment
	for _, a := range dbPayments {
		payments = append(payments, convertPayment(a))
	}

	rsp := &pb.ListPaymentsResponse{
		Payments: payments,
	}

	return rsp, nil
}

func validateListPaymentsRequest(req *pb.ListPaymentsRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("account_id", errors.New("must be greater than 0")))
	}

	return violations
}
