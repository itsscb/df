package gapi

import (
	"context"
	"database/sql"
	"errors"
	"fmt"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) UpdateAccountPrivacy(ctx context.Context, req *pb.UpdateAccountPrivacyRequest) (*pb.UpdateAccountPrivacyResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateUpdateAccountPrivacyRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, req.GetId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		return nil, status.Errorf(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}
	privacyAccepted := req.GetPrivacyAccepted()

	arg := db.UpdateAccountPrivacyTxParams{
		Changer:         authPayload.Email,
		ID:              req.GetId(),
		PrivacyAccepted: &privacyAccepted,
	}

	account, err = server.store.UpdateAccountPrivacyTx(ctx, arg)
	if err != nil {
		return nil, status.Error(codes.Internal, "failed to update account privacy")
	}

	rsp := &pb.UpdateAccountPrivacyResponse{
		Account: convertAccount(account),
	}

	return rsp, nil
}

func validateUpdateAccountPrivacyRequest(req *pb.UpdateAccountPrivacyRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := val.ValidateString(fmt.Sprint(req.GetId()), 30, 70); err != nil {
		violations = append(violations, fieldViolation("id", err))
	}
	return violations
}
