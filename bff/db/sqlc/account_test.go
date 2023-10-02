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

	creator := util.RandomName()

	arg := CreateAccountParams{
		Passwordhash: util.RandomString(30),
		Firstname:    util.RandomName(),
		Lastname:     util.RandomName(),
		Birthday:     time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Email:        util.RandomEmail(),
		Phone: sql.NullString{
			Valid:  true,
			String: util.RandomPhone(),
		},
		PrivacyAccepted: sql.NullBool{
			Valid: true,
			Bool:  true,
		},
		PrivacyAcceptedDate: sql.NullTime{
			Valid: true,
			Time:  timestamp,
		},
		City:    util.RandomString(15),
		Zip:     util.RandomString(5),
		Street:  util.RandomString(20),
		Country: util.RandomString(15),
		Creator: creator,
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.Passwordhash, account.Passwordhash)
	require.Equal(t, arg.Firstname, account.Firstname)
	require.Equal(t, arg.Lastname, account.Lastname)
	require.Equal(t, arg.Birthday, account.Birthday)
	require.Equal(t, arg.Email, account.Email)
	require.Equal(t, arg.Phone, account.Phone)
	require.Equal(t, arg.City, account.City)
	require.Equal(t, arg.Zip, account.Zip)
	require.Equal(t, arg.Street, account.Street)
	require.Equal(t, arg.Country, account.Country)
	require.Equal(t, arg.Creator, account.Creator)
	require.Equal(t, arg.Creator, account.Changer)

	require.NotZero(t, account.ID)
	require.NotZero(t, account.Created)

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
	require.Equal(t, newAccount.Firstname, account.Firstname)
	require.Equal(t, newAccount.Lastname, account.Lastname)
	require.Equal(t, newAccount.Birthday, account.Birthday)
	require.Equal(t, newAccount.Email, account.Email)
	require.Equal(t, newAccount.Phone, account.Phone)
	require.Equal(t, newAccount.City, account.City)
	require.Equal(t, newAccount.Zip, account.Zip)
	require.Equal(t, newAccount.Street, account.Street)
	require.Equal(t, newAccount.Country, account.Country)
	require.Equal(t, newAccount.Creator, account.Creator)
	require.Equal(t, newAccount.Changer, account.Changer)

	require.WithinDuration(t, newAccount.Created, account.Created, time.Second)
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

func TestUpdateAccount(t *testing.T) {
	account1 := createRandomAccount(t)
	require.NotEmpty(t, account1)

	arg := UpdateAccountParams{
		ID: account1.ID,
		Phone: sql.NullString{
			String: util.RandomPhone(),
			Valid:  true,
		},
	}

	account2, err := testQueries.UpdateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account2)

	require.Equal(t, account1.ID, account2.ID)
	require.Equal(t, account1.Lastname, account2.Lastname)
	require.NotEqual(t, account1.Phone, account2.Phone)
	require.NotEqual(t, account1.Changer, account2.Changer)
}

func TestUpdateAccountPrivacy(t *testing.T) {
	account1 := createRandomAccount(t)
	require.NotEmpty(t, account1)

	changer1 := util.RandomName()

	arg := UpdateAccountPrivacyParams{
		ID: account1.ID,
		PrivacyAccepted: sql.NullBool{
			Valid: true,
			Bool:  false,
		},
		PrivacyAcceptedDate: sql.NullTime{
			Valid: true,
			Time:  time.Time{},
		},
		Changer: changer1,
	}

	account2, err := testQueries.UpdateAccountPrivacy(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account2)

	require.Equal(t, account1.ID, account2.ID)
	require.Equal(t, account1.Lastname, account2.Lastname)
	require.WithinDuration(t, time.Time{}, account2.PrivacyAcceptedDate.Time, time.Second)
	require.NotEqual(t, account1.PrivacyAccepted.Bool, account2.PrivacyAccepted.Bool)
	require.NotEqual(t, account1.PrivacyAcceptedDate.Time, account2.PrivacyAcceptedDate.Time)

	arg.PrivacyAccepted = sql.NullBool{
		Valid: true,
		Bool:  true,
	}

	arg.PrivacyAcceptedDate = sql.NullTime{
		Valid: true,
		Time:  timestamp.UTC(),
	}

	account1, err = testQueries.UpdateAccountPrivacy(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account2)

	require.Equal(t, account1.ID, account2.ID)
	require.Equal(t, account1.Lastname, account2.Lastname)
	require.WithinDuration(t, timestamp.UTC(), account1.PrivacyAcceptedDate.Time, time.Second)
	require.NotEqual(t, account1.PrivacyAccepted.Bool, account2.PrivacyAccepted.Bool)
	require.NotEqual(t, account1.PrivacyAcceptedDate.Time, account2.PrivacyAcceptedDate.Time)
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
