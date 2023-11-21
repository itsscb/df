package gapi

import (
	"context"
	"log/slog"

	"github.com/itsscb/df/bff/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (server *Server) DeleteEmailAddress(ctx context.Context, req *pb.DeleteEmailAddressRequest) (*pb.DeleteEmailAddressResponse, error) {
	authPayload, err := server.authorizeUser(ctx)
	if err != nil {
		return nil, unauthenticatedError(err)
	}

	// TODO: Check if Person belongs to Account

	err = server.store.DeleteEmailAddress(ctx, req.GetId())
	if err != nil {
		slog.Error("remove_email (write)", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.Int64("email_id", int64(req.GetId())), slog.String("error", err.Error()))
		return nil, status.Error(codes.Internal, "failed to insert email")
	}

	response := &pb.DeleteEmailAddressResponse{
		Id: req.GetId(),
	}

	return response, err
}
