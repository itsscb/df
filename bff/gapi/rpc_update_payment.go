package gapi

import (
	"context"
	"database/sql"
	"errors"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) UpdatePayment(ctx context.Context, req *pb.UpdatePaymentRequest) (*pb.UpdatePaymentResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateUpdatePaymentRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	dbPayment, err := server.store.GetPayment(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "payment not found")
		}
		return nil, status.Error(codes.Internal, "failed to get payment")
	}

	if dbPayment.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "payment not found")
		}
	}

	arg := db.UpdatePaymentParams{
		ID: req.GetId(),
		PaymentCategory: sql.NullString{
			Valid:  req.GetPaymentCategory() != "",
			String: req.GetPaymentCategory(),
		},
		Bankname: sql.NullString{
			Valid:  req.GetBankname() != "",
			String: req.GetBankname(),
		},
		Iban: sql.NullString{
			Valid:  req.GetIBAN() != "",
			String: req.GetIBAN(),
		},
		Bic: sql.NullString{
			Valid:  req.GetBIC() != "",
			String: req.GetBIC(),
		},
		PaypalAccount: sql.NullString{
			Valid:  req.GetPaypalAccount() != "",
			String: req.GetPaypalAccount(),
		},
		PaypalID: sql.NullString{
			Valid:  req.GetPaypalId() != "",
			String: req.GetPaypalId(),
		},
		PaymentSystem: sql.NullString{
			Valid:  req.GetPaymentSystem() != "",
			String: req.GetPaymentSystem(),
		},
		Type: sql.NullString{
			Valid:  req.GetType() != "",
			String: req.GetType(),
		},
		Changer: authPayload.Email,
	}

	payment, err := server.store.UpdatePayment(ctx, arg)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to update payment")
	}

	rsp := &pb.UpdatePaymentResponse{
		Payment: convertPayment(payment),
	}

	return rsp, nil
}

func validateUpdatePaymentRequest(req *pb.UpdatePaymentRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	if req.GetPaypalAccount() != "" {
		if err := val.ValidateEmail(req.GetPaypalAccount()); err != nil {
			violations = append(violations, fieldViolation("email", err))
		}
	}

	return violations
}
