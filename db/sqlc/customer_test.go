package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func TestCreateCustomer(t *testing.T) {
	arg := CreateCutomerParams{
		Username:     "whoami123",
		Passwordhash: "abcdefghijklmnopqrstuvwxyz123456789",
		Firstname:    "John",
		Lastname:     "Doe",
		Birthday:     time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Email:        "john.doe@example.com",
		Phone: sql.NullString{
			Valid:  true,
			String: "0123456789",
		},
		City:    "New York",
		Zip:     "12345",
		Street:  "Main Street 1",
		Country: "United States",
		Creator: "user",
	}

	account, err := testQueries.CreateCutomer(context.Background(), arg)
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

	_ = testQueries.DeleteCustomer(context.Background(), account.ID)
}
