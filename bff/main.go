package main

import (
	"database/sql"
	"embed"
	"io/fs"
	"log"
	"net/http"

	"github.com/itsscb/df/bff/api"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/util"
	_ "github.com/lib/pq"
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

	if config.Environment == "development" {
		subDir, err := fs.Sub(swaggerFiles, "doc/swagger")
		if err != nil {
			log.Fatalf("could not import swagger files")
		}
		swaggerFS = http.FS(subDir)
	}

	store := db.NewStore(conn)
	server, err := api.NewServer(config, store, swaggerFS)
	if err != nil {
		log.Fatalf("could not start server: %s", err)
	}

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
