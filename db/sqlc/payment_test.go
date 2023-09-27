package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomPayment(t *testing.T) Payment {
	account := createRandomAccount(t)
	require.NotEmpty(t, account)

	creator := util.RandomName()

	arg := CreatePaymentParams{
		AccountID:       account.ID,
		PaymentCategory: util.RandomName(),
		Bankname: sql.NullString{
			Valid:  true,
			String: util.RandomName(),
		},
		IBAN: sql.NullString{
			Valid:  true,
			String: util.RandomName(),
		},
		BIC: sql.NullString{
			Valid:  true,
			String: util.RandomName(),
		},
		PaypalAccount: sql.NullString{
			Valid:  true,
			String: util.RandomName(),
		},
		PaypalID: sql.NullString{
			Valid:  true,
			String: util.RandomName(),
		},
		PaymentSystem: sql.NullString{
			Valid:  true,
			String: util.RandomName(),
		},
		Type:    util.RandomName(),
		Creator: creator,
		Changer: creator,
	}

	person, err := testQueries.CreatePayment(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, person)

	require.Equal(t, arg.PaymentCategory, person.PaymentCategory)
	require.Equal(t, arg.Bankname, person.Bankname)
	require.Equal(t, arg.AccountID, person.AccountID)
	require.Equal(t, arg.IBAN, person.IBAN)
	require.Equal(t, arg.BIC, person.BIC)
	require.Equal(t, arg.PaypalAccount, person.PaypalAccount)
	require.Equal(t, arg.PaymentSystem, person.PaymentSystem)
	require.Equal(t, arg.PaypalID, person.PaypalID)
	require.Equal(t, arg.Creator, person.Creator)
	require.Equal(t, arg.Type, person.Type)

	require.NotZero(t, person.ID)
	require.NotZero(t, person.Created)

	return person
}

func TestCreatePayment(t *testing.T) {
	createRandomPayment(t)
}

func TestGetPayment(t *testing.T) {
	newperson := createRandomPayment(t)
	require.NotEmpty(t, newperson)

	person, err := testQueries.GetPayment(context.Background(), newperson.ID)
	require.NoError(t, err)
	require.NotEmpty(t, person)

	require.Equal(t, newperson.PaymentCategory, person.PaymentCategory)
	require.Equal(t, newperson.Bankname, person.Bankname)
	require.Equal(t, newperson.AccountID, person.AccountID)
	require.Equal(t, newperson.IBAN, person.IBAN)
	require.Equal(t, newperson.BIC, person.BIC)
	require.Equal(t, newperson.PaypalAccount, person.PaypalAccount)
	require.Equal(t, newperson.PaymentSystem, person.PaymentSystem)
	require.Equal(t, newperson.PaypalID, person.PaypalID)
	require.Equal(t, newperson.Creator, person.Creator)
	require.Equal(t, newperson.Type, person.Type)

	require.WithinDuration(t, newperson.Created, person.Created, time.Second)
}

func TestDeletePayment(t *testing.T) {
	person1 := createRandomPayment(t)
	err := testQueries.DeletePayment(context.Background(), person1.ID)
	require.NoError(t, err)

	person2, err := testQueries.GetPayment(context.Background(), person1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, person2)
}

func TestUpdatePayment(t *testing.T) {
	person1 := createRandomPayment(t)
	require.NotEmpty(t, person1)

	arg := UpdatePaymentParams{
		ID: person1.ID,
		Bankname: sql.NullString{
			String: util.RandomName(),
			Valid:  true,
		},
	}

	person2, err := testQueries.UpdatePayment(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, person2)

	require.Equal(t, person1.ID, person2.ID)
	require.Equal(t, person1.PaymentCategory, person2.PaymentCategory)
	require.NotEqual(t, person1.Bankname, person2.Bankname)
}

func TestListPayments(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomPayment(t)
	}

	arg := ListPaymentsParams{
		Limit:  5,
		Offset: 5,
	}

	persons, err := testQueries.ListPayments(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, persons, 5)

	for _, person := range persons {
		require.NotEmpty(t, person)
	}
}
