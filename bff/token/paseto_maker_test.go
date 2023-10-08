package token

import (
	"testing"
	"time"

	"github.com/itsscb/df/bff/util"
	"github.com/stretchr/testify/require"
)

func TestPasetoMaker(t *testing.T) {
	maker, err := NewPasetoMaker(devPrivateKeyHex)
	require.NoError(t, err)

	email := util.RandomEmail()
	duration := time.Minute * 2

	issuedAt := time.Now()
	expiredAt := issuedAt.Add(duration)

	id, err := maker.NewTokenID()
	require.NoError(t, err)
	token, payload, err := maker.CreateToken(email, id, duration)
	require.NoError(t, err)
	require.NotEmpty(t, token)
	require.NotEmpty(t, payload)

	payload, err = maker.VerifyToken(token)
	require.NoError(t, err)
	require.NotEmpty(t, token)

	require.NotZero(t, payload.ID)
	require.Equal(t, email, payload.Email)
	require.WithinDuration(t, issuedAt, payload.IssuedAt, time.Second)
	require.WithinDuration(t, expiredAt, payload.ExpiredAt, time.Second)
}

func TestExpiredPasetoToken(t *testing.T) {
	maker, err := NewPasetoMaker(devPrivateKeyHex)
	require.NoError(t, err)

	id, err := maker.NewTokenID()
	require.NoError(t, err)
	token, payload, err := maker.CreateToken(util.RandomEmail(), id, -time.Minute)
	require.NoError(t, err)
	require.NotEmpty(t, token)
	require.NotEmpty(t, payload)

	payload, err = maker.VerifyToken(token)
	require.Error(t, err)
	require.EqualError(t, err, ErrExpiredToken.Error())
	require.Nil(t, payload)
}
