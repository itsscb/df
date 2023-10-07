// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.22.0
// source: session.sql

package db

import (
	"context"
	"time"

	"github.com/google/uuid"
)

const blockSession = `-- name: BlockSession :exec
UPDATE sessions
SET
    "is_blocked" = true
WHERE "id" = $1
`

func (q *Queries) BlockSession(ctx context.Context, id uuid.UUID) error {
	_, err := q.db.ExecContext(ctx, blockSession, id)
	return err
}

const createSession = `-- name: CreateSession :one
INSERT INTO sessions (
  id,
  email,
  refresh_token,
  user_agent,
  client_ip,
  is_blocked,
  expires_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
) RETURNING id, email, user_agent, client_ip, refresh_token, is_blocked, expires_at, created_at
`

type CreateSessionParams struct {
	ID           uuid.UUID `json:"id"`
	Email        string    `json:"email"`
	RefreshToken string    `json:"refresh_token"`
	UserAgent    string    `json:"user_agent"`
	ClientIp     string    `json:"client_ip"`
	IsBlocked    bool      `json:"is_blocked"`
	ExpiresAt    time.Time `json:"expires_at"`
}

func (q *Queries) CreateSession(ctx context.Context, arg CreateSessionParams) (Session, error) {
	row := q.db.QueryRowContext(ctx, createSession,
		arg.ID,
		arg.Email,
		arg.RefreshToken,
		arg.UserAgent,
		arg.ClientIp,
		arg.IsBlocked,
		arg.ExpiresAt,
	)
	var i Session
	err := row.Scan(
		&i.ID,
		&i.Email,
		&i.UserAgent,
		&i.ClientIp,
		&i.RefreshToken,
		&i.IsBlocked,
		&i.ExpiresAt,
		&i.CreatedAt,
	)
	return i, err
}

const getSession = `-- name: GetSession :one
SELECT id, email, user_agent, client_ip, refresh_token, is_blocked, expires_at, created_at FROM sessions
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetSession(ctx context.Context, id uuid.UUID) (Session, error) {
	row := q.db.QueryRowContext(ctx, getSession, id)
	var i Session
	err := row.Scan(
		&i.ID,
		&i.Email,
		&i.UserAgent,
		&i.ClientIp,
		&i.RefreshToken,
		&i.IsBlocked,
		&i.ExpiresAt,
		&i.CreatedAt,
	)
	return i, err
}
