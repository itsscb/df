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

func (server *Server) CreatePayment(ctx context.Context, req *pb.CreatePaymentRequest) (*pb.CreatePaymentResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateCreatePaymentRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, req.GetAccountId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		return nil, status.Error(codes.NotFound, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	arg := db.CreatePaymentParams{
		AccountID:       req.GetAccountId(),
		PaymentCategory: req.GetPaymentCategory(),
		Bankname: sql.NullString{
			Valid:  req.GetBankname() != "",
			String: req.GetBankname(),
		},
		IBAN: sql.NullString{
			Valid:  req.GetIBAN() != "",
			String: req.GetIBAN(),
		},
		BIC: sql.NullString{
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
		Type:    req.GetType(),
		Creator: authPayload.Email,
		Changer: authPayload.Email,
	}

	payment, err := server.store.CreatePayment(ctx, arg)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to create payment")
	}

	rsp := &pb.CreatePaymentResponse{
		Payment: convertPayment(payment),
	}

	return rsp, nil
}

func validateCreatePaymentRequest(req *pb.CreatePaymentRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	// TODO: #80 Add Validations to rpc_create_payment
	if req.GetAccountId() < 1 {
		violations = append(violations, fieldViolation("account_id", errors.New("must be greater than 0")))
	}

	if err := val.ValidateEmail(req.GetPaypalAccount()); err != nil {
		violations = append(violations, fieldViolation("paypal_account", err))
	}

	// if err := val.ValidateName(req.GetPaymentCategory()); err != nil {
	// 	violations = append(violations, fieldViolation("payment_category", err))
	// }

	// if err := val.ValidateName(req.GetBankname()); err != nil {
	// 	violations = append(violations, fieldViolation("bankname", err))
	// }

	// if err := val.ValidateAlphaSpace(req.GetIBAN()); err != nil {
	// 	violations = append(violations, fieldViolation("IBAN", err))
	// }

	// if err := val.ValidateAlphaSpace(req.GetBIC()); err != nil {
	// 	violations = append(violations, fieldViolation("BIC", err))
	// }

	return violations
}
