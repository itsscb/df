package gapi

import (
	"context"
	"database/sql"
	"errors"
	"log/slog"

	"github.com/google/uuid"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) BlockSession(ctx context.Context, req *pb.BlockSessionRequest) (*pb.BlockSessionResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateBlockSessionRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	uid := uuid.MustParse(req.GetSessionId())
	session, err := server.store.GetSession(ctx, uid)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Errorf(codes.NotFound, "session not found")
		}
		slog.Error("block_session (get)", slog.String("invoked_by", authPayload.Email), slog.String("session_id", req.GetSessionId()), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to get session")
	}

	if session.Email != authPayload.Email {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.NotFound, "session not found")
		}
	}

	if session.IsBlocked {
		return nil, status.Errorf(codes.OK, "session already blocked")
	}

	err = server.store.BlockSession(ctx, uid)
	if err != nil {
		slog.Error("block_session (db)", slog.String("invoked_by", authPayload.Email), slog.String("session_id", req.GetSessionId()), slog.String("error", err.Error()))
		return nil, status.Errorf(codes.Internal, "failed to block session")

	}

	rsp := &pb.BlockSessionResponse{
		SessionId: uid.String(),
		Blocked:   true,
	}
	return rsp, nil
}

func validateBlockSessionRequest(req *pb.BlockSessionRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := val.ValidateString(req.GetSessionId(), 30, 100); err != nil {
		violations = append(violations, fieldViolation("session_id", err))
	}

	return violations
}
