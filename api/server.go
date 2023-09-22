package api

import (
	"log/slog"
	"os"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/db/sqlc"
)

// Server serves HTTP requests for df service
type Server struct {
	store  db.Store
	router *gin.Engine
}

// NewServer creates a new HTTP server and sets up routing
func NewServer(store db.Store) *Server {
	server := &Server{
		store: store,
	}

	opts := slog.HandlerOptions{
		Level: slog.LevelDebug,
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
