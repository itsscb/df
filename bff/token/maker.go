package token

import (
	"time"

	"github.com/google/uuid"
)

// Maker is an interface for managing tokens
type Maker interface {
	NewTokenID() (uuid.UUID, error)
	// CreateToken creates a new token for a specific username and duration
	CreateToken(email string, id uuid.UUID, duration time.Duration) (string, *Payload, error)

	// VerifyToken checks if the token is valid or not
	VerifyToken(token string) (*Payload, error)
}
