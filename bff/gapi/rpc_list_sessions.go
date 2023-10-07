package gapi

import (
	"context"
	"database/sql"
	"errors"

	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/val"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) ListSessions(ctx context.Context, req *pb.ListSessionsRequest) (*pb.ListSessionsResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	violations := validateListSessionsRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	dbSessions, err := server.store.ListSessions(ctx, req.GetEmail())
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			return nil, status.Error(codes.NotFound, "no accounts found")
		}
		return nil, status.Error(codes.NotFound, "failed to get accounts")
	}
	if authPayload.Email != req.GetEmail() {
		if !server.isAdmin(ctx, authPayload) {
			return nil, status.Error(codes.PermissionDenied, "only for administrators")
		}
	}

	var sessions []*pb.Session
	for _, s := range dbSessions {
		sessions = append(sessions, convertSession(s))
	}

	rsp := &pb.ListSessionsResponse{
		Session: sessions,
	}

	return rsp, nil
}

func validateListSessionsRequest(req *pb.ListSessionsRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := val.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	return violations
}
