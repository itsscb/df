package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomCustomer(t *testing.T) Customer {
	arg := CreateCustomerParams{
		Username:     util.RandomUser(),
		Passwordhash: util.RandomString(30),
		Firstname:    util.RandomUser(),
		Lastname:     util.RandomUser(),
		Birthday:     time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Email:        util.RandomEmail(),
		Phone: sql.NullString{
			Valid:  true,
			String: util.RandomPhone(),
		},
		City:    util.RandomString(15),
		Zip:     util.RandomString(5),
		Street:  util.RandomString(20),
		Country: util.RandomString(15),
		Creator: util.RandomUser(),
	}

	account, err := testQueries.CreateCustomer(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.Username, account.Username)
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

	require.NotZero(t, account.ID)
	require.NotZero(t, account.Created)

	return account
}

func TestCreateCustomer(t *testing.T) {
	createRandomCustomer(t)
}

func TestGetCustomer(t *testing.T) {
	newAccount := createRandomCustomer(t)
	require.NotEmpty(t, newAccount)

	account, err := testQueries.GetCustomer(context.Background(), newAccount.ID)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, newAccount.Username, account.Username)
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

	require.WithinDuration(t, newAccount.Created, account.Created, time.Second)
}

func TestDeleteCustomer(t *testing.T) {
	account1 := createRandomCustomer(t)
	err := testQueries.DeleteCustomer(context.Background(), account1.ID)
	require.NoError(t, err)

	account2, err := testQueries.GetCustomer(context.Background(), account1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, account2)
}

func TestUpdateCustomer(t *testing.T) {
	account1 := createRandomCustomer(t)
	require.NotEmpty(t, account1)

	arg := UpdateCustomerParams{
		ID: account1.ID,
		Phone: sql.NullString{
			String: util.RandomPhone(),
			Valid:  true,
		},
	}

	account2, err := testQueries.UpdateCustomer(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account2)

	require.Equal(t, account1.ID, account2.ID)
	require.Equal(t, account1.Username, account2.Username)
	require.NotEqual(t, account1.Phone, account2.Phone)
}

func TestListCustomers(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomCustomer(t)
	}

	arg := ListCustomersParams{
		Limit:  5,
		Offset: 5,
	}

	accounts, err := testQueries.ListCustomers(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, accounts, 5)

	for _, account := range accounts {
		require.NotEmpty(t, account)
	}
}
