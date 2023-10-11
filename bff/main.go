package main

import (
	"context"
	"database/sql"
	"embed"
	"io/fs"
	"log"
	"log/slog"
	"net"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"github.com/itsscb/df/bff/api"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/gapi"
	"github.com/itsscb/df/bff/gw"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/util"
	_ "github.com/lib/pq"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"google.golang.org/protobuf/encoding/protojson"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
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

	runDBMigration(config.MigrationURL, config.DBSource, config.MigrationRetries)

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

func runDBMigration(migrationURL string, dbSource string, retries int) {
	migration, err := migrate.New(migrationURL, dbSource)
	if err != nil {
		slog.Warn("could not migrate db instance. Retrying...")

		count := 1
		var e error
		for range time.Tick(3 * time.Second) {
			slog.Info("migrate db", slog.Int("retry number", count), slog.Int("max retries", retries))
			migration, e = migrate.New(migrationURL, dbSource)
			if e == nil || count >= retries {
				break
			}
			count++
		}
		if e != nil {
			log.Fatalf("cannot create new migrate instance for '%s': %s", migrationURL, err)
		}
	}

	if err = migration.Up(); err != nil && err != migrate.ErrNoChange {
		log.Fatal("failed to run migrate up")
	}

	slog.Info("db migrated successfully")
}

func runGRPCServer(config util.Config, store db.Store) {
	server, err := gapi.NewServer(config, store)
	if err != nil {
		log.Fatalf("could not start server: %s", err)
	}

	grpcLogger := grpc.UnaryInterceptor(gapi.GrpcLogger)
	grpcServer := grpc.NewServer(grpcLogger)
	pb.RegisterDfServer(grpcServer, server)
	reflection.Register(grpcServer)

	listener, err := net.Listen("tcp", config.GRPCServerAddress)
	if err != nil {
		log.Fatal("cannot create gRPC server:", err)
	}

	slog.Info("start gRPC server", slog.String("address", listener.Addr().String()))

	err = grpcServer.Serve(listener)
	if err != nil {
		log.Fatal("cannot start gRPC server:", err)
	}
}

func runGatewayServer(config util.Config, store db.Store, swaggerFS http.FileSystem) {
	server, err := gw.NewServer(config, store, swaggerFS)
	if err != nil {
		log.Fatal("cannot create server")
	}

	// server, err := gapi.NewServer(config, store)
	// if err != nil {
	// 	log.Fatal("cannot create server")
	// }

	jsonOption := runtime.WithMarshalerOption(runtime.MIMEWildcard, &runtime.JSONPb{
		MarshalOptions: protojson.MarshalOptions{
			UseProtoNames:   true,
			EmitUnpopulated: true,
		},
		UnmarshalOptions: protojson.UnmarshalOptions{
			DiscardUnknown: true,
		},
	})

	grpcMux := runtime.NewServeMux(jsonOption)

	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	err = pb.RegisterDfHandlerServer(ctx, grpcMux, &server.Grpc)
	if err != nil {
		log.Fatal("cannot register handler server")
	}

	mux := gin.New()
	mux.Group("v1/*{grpc_gateway}").Any("", gin.WrapH(grpcMux))
	mux.POST("documents/upload", server.UploadDocument)
	mux.StaticFS("/swagger/", swaggerFS)

	listener, err := net.Listen("tcp", config.HTTPServerAddress)
	if err != nil {
		log.Fatal("cannot create listener")
	}

	slog.Info("start HTTP gateway server", slog.String("address", listener.Addr().String()))
	handler := gapi.HttpLogger(mux)
	err = http.Serve(listener, handler)
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
