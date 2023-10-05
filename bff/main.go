package main

import (
	"context"
	"database/sql"
	"embed"
	"io/fs"
	"log"
	"net"
	"net/http"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"github.com/itsscb/df/bff/api"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/gapi"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/util"
	_ "github.com/lib/pq"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"google.golang.org/protobuf/encoding/protojson"
)

//go:embed doc/swagger
var swaggerFiles embed.FS

func main() {
	var swaggerFS http.FileSystem
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatalf("could not connect to DB: %s", err)
	}

	store := db.NewStore(conn)

	if config.Environment == "development" {
		subDir, err := fs.Sub(swaggerFiles, "doc/swagger")
		if err != nil {
			log.Fatalf("could not import swagger files")
		}
		swaggerFS = http.FS(subDir)
	}

	go runGatewayServer(config, store, swaggerFS)
	runGRPCServer(config, store)
}

func runGRPCServer(config util.Config, store db.Store) {
	server, err := gapi.NewServer(config, store)
	if err != nil {
		log.Fatalf("could not start server: %s", err)
	}

	grpcServer := grpc.NewServer()
	pb.RegisterDfServer(grpcServer, server)
	reflection.Register(grpcServer)

	listener, err := net.Listen("tcp", config.GRPCServerAddress)
	if err != nil {
		log.Fatal("cannot create gRPC server:", err)
	}

	log.Printf("start gRPC server at %s", listener.Addr().String())
	err = grpcServer.Serve(listener)
	if err != nil {
		log.Fatal("cannot start gRPC server:", err)
	}
}

func runGatewayServer(config util.Config, store db.Store, swaggerFS http.FileSystem) {
	server, err := gapi.NewServer(config, store)
	if err != nil {
		log.Fatal("cannot create server")
	}

	jsonOption := runtime.WithMarshalerOption(runtime.MIMEWildcard, &runtime.JSONPb{
		MarshalOptions: protojson.MarshalOptions{
			UseProtoNames: true,
		},
		UnmarshalOptions: protojson.UnmarshalOptions{
			DiscardUnknown: true,
		},
	})

	grpcMux := runtime.NewServeMux(jsonOption)

	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	err = pb.RegisterDfHandlerServer(ctx, grpcMux, server)
	if err != nil {
		log.Fatal("cannot register handler server")
	}

	mux := http.NewServeMux()
	mux.Handle("/", grpcMux)

	swaggerHandler := http.StripPrefix("/swagger/", http.FileServer(swaggerFS))
	mux.Handle("/swagger/", swaggerHandler)

	listener, err := net.Listen("tcp", config.HTTPServerAddress)
	if err != nil {
		log.Fatal("cannot create listener")
	}

	log.Printf("start HTTP gateway server at %s\n", listener.Addr().String())
	err = http.Serve(listener, mux)
	if err != nil {
		log.Fatal("cannot start HTTP gateway server")
	}
}

func runHTTPServer(config util.Config, store db.Store, swaggerFS http.FileSystem) {
	server, err := api.NewServer(config, store, swaggerFS)
	if err != nil {
		log.Fatalf("could not start server: %s", err)
	}

	err = server.Start(config.HTTPServerAddress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
