package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) DeleteDocument(ctx context.Context, req *pb.DeleteDocumentRequest) (*pb.DeleteDocumentResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateDeleteDocumentRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccount(ctx, authPayload.AccountID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("delete_document (get_account)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("document_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.AccountID != account.ID {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	var document db.Document

	if !server.isAdmin(ctx, authPayload) {
		document, err = server.store.GetDocumentByIDWithAccountID(ctx, db.GetDocumentByIDWithAccountIDParams{
			ID:        req.GetId(),
			AccountID: account.ID,
		})
	} else {
		document, err = server.store.GetDocument(ctx, req.GetId())
	}
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "document not found")
		}
		slog.Error("delete_document (get_document)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("document_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to get document")
	}

	code, err := server.store.DeleteDocumentTx(ctx, document.ID)
	if err != nil {
		slog.Error("delete_document (db)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("document_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Errorf(code, "failed to delete document")
	}

	rsp := &pb.DeleteDocumentResponse{
		Id:      document.ID,
		Deleted: true,
	}
	return rsp, nil
}

func validateDeleteDocumentRequest(req *pb.DeleteDocumentRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetId() < 1 {
		violations = append(violations, fieldViolation("id", errors.New("must be greater than 0")))
	}

	return violations
}
