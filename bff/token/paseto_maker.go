package token

import (
	"time"

	"aidanwoods.dev/go-paseto"
	"github.com/google/uuid"
)

// PasetoMaker is a PASETO token maker
type PasetoMaker struct {
	privateKey paseto.V4AsymmetricSecretKey
	publicKey  paseto.V4AsymmetricPublicKey
	parser     paseto.Parser
}

// NewPasetoMaker creates a new PasetoMaker
func NewPasetoMaker(privateKeyHex string) (Maker, error) {
	privateKey, err := paseto.NewV4AsymmetricSecretKeyFromHex(privateKeyHex)
	if err != nil {
		return nil, err
	}

	maker := &PasetoMaker{
		privateKey: privateKey,
		publicKey:  privateKey.Public(),
		parser:     paseto.NewParser(),
	}

	return maker, nil
}

func (maker *PasetoMaker) NewTokenID() (uuid.UUID, error) {
	return uuid.NewRandom()
}

// CreateToken creates a new token for a specific username and duration
func (maker *PasetoMaker) CreateToken(email string, id uuid.UUID, duration time.Duration) (string, *Payload, error) {
	payload, err := NewPayload(email, id, duration)
	if err != nil {
		return "", payload, err
	}

	token := paseto.NewToken()
	token.SetNotBefore(time.Now())
	token.SetIssuedAt(payload.IssuedAt)
	token.SetExpiration(payload.ExpiredAt)
	token.SetString("id", id.String())
	token.SetString("email", payload.Email)

	signed := token.V4Sign(maker.privateKey, nil)
	return signed, payload, err
}

// VerifyToken checks if the token is valid or not
func (maker *PasetoMaker) VerifyToken(token string) (*Payload, error) {
	payload := &Payload{}

	t, err := maker.parser.ParseV4Public(maker.publicKey, token, nil)
	if err != nil {
		return nil, err
	}

	payload.ExpiredAt, err = t.GetExpiration()
	if err != nil {
		return nil, ErrInvalidToken
	}

	payload.IssuedAt, err = t.GetIssuedAt()
	if err != nil {
		return nil, ErrInvalidToken
	}

	payload.Email, err = t.GetString("email")
	if err != nil {
		return nil, ErrInvalidToken
	}

	uid, err := t.GetString("id")
	if err != nil {
		return nil, ErrInvalidToken
	}

	payload.ID = uuid.MustParse(uid)
	err = payload.Valid()
	if err != nil {
		return nil, err
	}

	return payload, nil
}
