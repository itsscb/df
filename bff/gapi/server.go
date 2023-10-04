package gapi

import (
	"context"
	"fmt"
	"log"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/token"
	"github.com/itsscb/df/bff/util"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

// Server serves gRPC requests for df service
type Server struct {
	pb.UnimplementedAccountsServer
	pb.UnimplementedSessionsServer
	store      db.Store
	config     util.Config
	tokenMaker token.Maker
}

func NewServer(config util.Config, store db.Store) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenPrivateKeyHex)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		store:      store,
		config:     config,
		tokenMaker: tokenMaker,
	}

	return server, nil
}

func (server *Server) RegisterServer(grpcServer *grpc.Server) {
	pb.RegisterAccountsServer(grpcServer, server)
	pb.RegisterSessionsServer(grpcServer, server)
	reflection.Register(grpcServer)
}

func (server *Server) RegisterHandler(ctx context.Context, mux *runtime.ServeMux) {
	err := pb.RegisterAccountsHandlerServer(ctx, mux, server)
	if err != nil {
		log.Fatal("cannot register handler server")
	}
	err = pb.RegisterSessionsHandlerServer(ctx, mux, server)
	if err != nil {
		log.Fatal("cannot register handler server")
	}
}
