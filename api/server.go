package api

import (
	"log/slog"
	"os"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/db/sqlc"
	"github.com/itsscb/df/util"
)

// Server serves HTTP requests for df service
type Server struct {
	store  db.Store
	router *gin.Engine
	config util.Config
}

// NewServer creates a new HTTP server and sets up routing
func NewServer(config util.Config, store db.Store) *Server {
	server := &Server{
		store:  store,
		config: config,
	}

	logLevel := slog.LevelError
	if config.Environment == "development" {
		logLevel = slog.LevelDebug
	}

	opts := slog.HandlerOptions{
		Level: logLevel,
	}
	logger := slog.New(slog.NewJSONHandler(os.Stdout, &opts))
	router := gin.New()

	router.Use(gin.Recovery())

	router.Use(Logger(logger))

	router.POST("/accounts", server.createAccount)
	router.GET("/accounts/:id", server.getAccount)
	router.GET("/accounts", server.listAccounts)

	server.router = router
	return server
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}

func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
