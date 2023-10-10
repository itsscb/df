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

func (server *Server) ListReturnsLog(ctx context.Context, req *pb.ListReturnsLogRequest) (*pb.ListReturnsLogResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateListReturnsLogRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "account not found")
		}
		slog.Error("list_returns_log_by_person_id (get_account)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetPersonId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to get account")
	}

	if authPayload.Email != account.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "account not found")
		}
	}

	// if account.ID != req.GetPersonId() {
	// 	if !server.isAdmin(ctx, authPayload) {
	// 		return nil, status.Error(codes.NotFound, "account not found")
	// 	}
	// }

	dbReturnsLog, err := server.store.ListReturnsLogsByPersonID(ctx, req.GetPersonId())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "no returns_logs found")
		}
		slog.Error("list_returns_log_by_person_id (db)", slog.String("invoked_by", authPayload.Email), slog.Int64("person_id", int64(req.GetPersonId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.NotFound, "failed to get returns_logs")
	}

	var returns_logs []*pb.ReturnsLog
	for _, a := range dbReturnsLog {
		returns_logs = append(returns_logs, convertReturnsLog(a))
	}

	rsp := &pb.ListReturnsLogResponse{
		ReturnsLog: returns_logs,
	}

	return rsp, nil
}

func validateListReturnsLogRequest(req *pb.ListReturnsLogRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if req.GetPersonId() < 1 {
		violations = append(violations, fieldViolation("account_id", errors.New("must be greater than 0")))
	}

	return violations
}
