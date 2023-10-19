package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/bff/util"
	"github.com/stretchr/testify/require"
)

var timestamp = time.Now()

func createRandomAccount(t *testing.T) Account {

	arg := CreateAccountParams{
		Passwordhash: util.RandomString(30),
		Email:        util.RandomEmail(),
		SecretKey: sql.NullString{
			String: util.RandomString(100),
			Valid:  true,
		},
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.Passwordhash, account.Passwordhash)
	require.Equal(t, arg.Email, account.Email)
	require.Equal(t, arg.SecretKey, account.SecretKey)

	require.NotZero(t, account.ID)

	return account
}

func TestCreateAccount(t *testing.T) {
	createRandomAccount(t)
}

func TestGetAccount(t *testing.T) {
	newAccount := createRandomAccount(t)
	require.NotEmpty(t, newAccount)

	account, err := testQueries.GetAccount(context.Background(), newAccount.ID)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, newAccount.Passwordhash, account.Passwordhash)
	require.Equal(t, newAccount.Email, account.Email)
	require.Equal(t, newAccount.SecretKey, account.SecretKey)
}

func TestDeleteAccount(t *testing.T) {
	account1 := createRandomAccount(t)
	err := testQueries.DeleteAccount(context.Background(), account1.ID)
	require.NoError(t, err)

	account2, err := testQueries.GetAccount(context.Background(), account1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, account2)
}

func TestListAccounts(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomAccount(t)
	}

	arg := ListAccountsParams{
		Limit:  5,
		Offset: 5,
	}

	accounts, err := testQueries.ListAccounts(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, accounts, 5)

	for _, account := range accounts {
		require.NotEmpty(t, account)
	}
}
