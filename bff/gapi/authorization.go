package gapi

import (
	"context"
	"database/sql"
	"fmt"
	"strings"
	"time"

	"github.com/itsscb/df/bff/token"
	"google.golang.org/grpc/metadata"
)

const (
	authorizationHeader = "authorization"
	authorizationBearer = "bearer"
)

func (server *Server) authorizeUser(ctx context.Context) (*token.Payload, error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return nil, fmt.Errorf("missing metadata")
	}

	values := md.Get(authorizationHeader)
	if len(values) == 0 {
		return nil, fmt.Errorf("missing authorization header")
	}

	authHeader := values[0]
	fields := strings.Fields(authHeader)
	if len(fields) < 2 {
		return nil, fmt.Errorf("invalid authorization header format")
	}

	authType := strings.ToLower(fields[0])
	if authType != authorizationBearer {
		return nil, fmt.Errorf("unsupported authorization type: %s", authType)
	}

	accessToken := fields[1]
	payload, err := server.tokenMaker.VerifyToken(accessToken)
	if err != nil {
		return nil, fmt.Errorf("invalid access token: %s", err)
	}

	session, err := server.store.GetSession(ctx, payload.ID)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, fmt.Errorf("no valid session found")
		}
		return nil, fmt.Errorf("could not get session")
	}

	if session.IsBlocked || time.Now().After(session.ExpiresAt) {
		return nil, fmt.Errorf("session blocked or expired")
	}

	return payload, nil
}

func (server *Server) isAdmin(ctx context.Context, payload *token.Payload) bool {
	acc, err := server.store.GetAccount(ctx, payload.AccountID)
	if err != nil {
		fmt.Printf("could not verify admin: %#v", err)
		return false
	}
	return acc.PermissionLevel > 0
}
