package api

import (
	"fmt"
	"log/slog"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/token"
	"github.com/itsscb/df/bff/util"
)

// Server serves HTTP requests for df service
type Server struct {
	store        db.Store
	router       *gin.Engine
	config       util.Config
	tokenMaker   token.Maker
	swaggerFiles http.FileSystem
}

// NewServer creates a new HTTP server and sets up routing
func NewServer(config util.Config, store db.Store, swaggerFS http.FileSystem) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenPrivateKeyHex)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		store:        store,
		config:       config,
		tokenMaker:   tokenMaker,
		swaggerFiles: swaggerFS,
	}
	router := gin.New()

	router.Use(gin.Recovery())

	logLevel := slog.LevelError
	if config.Environment == "development" {
		logLevel = slog.LevelDebug
		// router.Static("/swagger/", "./doc/swagger/")
	}

	if swaggerFS != nil {
		router.StaticFS("/swagger/", swaggerFS)
	}

	opts := slog.HandlerOptions{
		Level: logLevel,
	}
	logger := slog.New(slog.NewTextHandler(os.Stdout, &opts))

	if config.LogOutput == "json" {
		logger = slog.New(slog.NewJSONHandler(os.Stdout, &opts))
	}

	slog.SetDefault(logger)

	router.Use(Logger())

	router.POST("/login", server.loginAccount)
	router.POST("/tokens/renew_access", server.renewAccessToken)
	router.POST("/accounts", server.createAccount)

	authRoutes := router.Group("/").Use(authMiddleware(server.tokenMaker))
	authRoutes.PUT("/accounts", server.updateAccount)
	authRoutes.PUT("/accounts/privacy", server.updateAccountPrivacy)
	authRoutes.GET("/accounts/:id", server.getAccount)
	authRoutes.GET("/accounts", server.listAccounts)
	authRoutes.POST("/sessions", server.blockSession)

	server.router = router
	return server, nil
}

func (server *Server) Start(address string) error {
	return server.router.Run(address)
}

func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
