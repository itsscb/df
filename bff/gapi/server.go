package gapi

import (
	"fmt"
	"log/slog"
	"os"

	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/mail"
	"github.com/itsscb/df/bff/pb"
	"github.com/itsscb/df/bff/token"
	"github.com/itsscb/df/bff/util"
)

// Server serves gRPC requests for df service
type Server struct {
	pb.UnimplementedDfServer
	store      db.Store
	config     util.Config
	tokenMaker token.Maker
	mailSender mail.EmailSender
}

func NewServer(config util.Config, store db.Store) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenPrivateKeyHex)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	mailSender := mail.NewGmailSender("df", config.SMTPMail, config.SMTPPassword)

	server := &Server{
		store:      store,
		config:     config,
		tokenMaker: tokenMaker,
		mailSender: mailSender,
	}

	logLevel := slog.LevelError
	var logSource bool
	if config.Environment == "development" {
		logLevel = slog.LevelDebug
		logSource = true
	}

	opts := slog.HandlerOptions{
		Level:     logLevel,
		AddSource: logSource,
	}
	logger := slog.New(slog.NewTextHandler(os.Stdout, &opts))

	if config.LogOutput == "json" {
		logger = slog.New(slog.NewJSONHandler(os.Stdout, &opts))
	}

	slog.SetDefault(logger)

	return server, nil
}
