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

func (server *Server) DeletePayment(ctx context.Context, req *pb.DeletePaymentRequest) (*pb.DeletePaymentResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateDeletePaymentRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("delete_payment (get_account)", slog.String("invoked_by", authPayload.Email), slog.Int64("payment_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	payment, err := server.store.GetPayment(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "payment not found")
		}
		slog.Error("delete_payment (get_payment)", slog.String("invoked_by", authPayload.Email), slog.Int64("payment_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to get payment")
	}

	if payment.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "payment not found")
		}
	}

	err = server.store.DeletePayment(ctx, req.GetId())
	if err != nil {
		slog.Error("delete_payment (db)", slog.String("invoked_by", authPayload.Email), slog.Int64("payment_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to delete payment")

	}

	rsp := &pb.DeletePaymentResponse{
		Id:      payment.ID,
		Deleted: true,
	}
	return rsp, nil
}

func validateDeletePaymentRequest(req *pb.DeletePaymentRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	return violations
}
