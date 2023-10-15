package gw

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/gapi"
	"github.com/itsscb/df/bff/token"
	"github.com/itsscb/df/bff/util"
)

type Server struct {
	Grpc       gapi.Server
	store      db.Store
	config     util.Config
	tokenMaker token.Maker
	swaggerFS  http.FileSystem
}

func NewServer(config util.Config, store db.Store, swaggerFS http.FileSystem) (*Server, error) {
	gprcServer, err := gapi.NewServer(config, store)
	if err != nil {
		log.Fatal("cannot create gateway gPRC server")
	}

	tokenMaker, err := token.NewPasetoMaker(config.TokenPrivateKeyHex)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker for gateway server: %w", err)
	}

	server := &Server{
		Grpc:       *gprcServer,
		store:      store,
		config:     config,
		tokenMaker: tokenMaker,
		swaggerFS:  swaggerFS,
	}

	return server, nil
}

func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
