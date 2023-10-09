package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/bff/util"
	"github.com/stretchr/testify/require"
)

func TestUpdatePayment(t *testing.T) {
	payment1 := createRandomPayment(t)
	require.NotEmpty(t, payment1)

	arg := UpdatePaymentParams{
		ID: payment1.ID,
		Bankname: sql.NullString{
			String: util.RandomName(),
			Valid:  true,
		},
	}

	payment2, err := testQueries.UpdatePayment(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, payment2)

	require.Equal(t, payment1.ID, payment2.ID)
	require.Equal(t, payment1.PaymentCategory, payment2.PaymentCategory)
	require.NotEqual(t, payment1.Bankname, payment2.Bankname)
}

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

	payment, err := testQueries.CreatePayment(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, payment)

	require.Equal(t, arg.PaymentCategory, payment.PaymentCategory)
	require.Equal(t, arg.Bankname, payment.Bankname)
	require.Equal(t, arg.AccountID, payment.AccountID)
	require.Equal(t, arg.IBAN, payment.IBAN)
	require.Equal(t, arg.BIC, payment.BIC)
	require.Equal(t, arg.PaypalAccount, payment.PaypalAccount)
	require.Equal(t, arg.PaymentSystem, payment.PaymentSystem)
	require.Equal(t, arg.PaypalID, payment.PaypalID)
	require.Equal(t, arg.Creator, payment.Creator)
	require.Equal(t, arg.Type, payment.Type)

	require.NotZero(t, payment.ID)
	require.NotZero(t, payment.Created)

	return payment
}

func TestCreatePayment(t *testing.T) {
	createRandomPayment(t)
}

func TestGetPayment(t *testing.T) {
	newpayment := createRandomPayment(t)
	require.NotEmpty(t, newpayment)

	payment, err := testQueries.GetPayment(context.Background(), newpayment.ID)
	require.NoError(t, err)
	require.NotEmpty(t, payment)

	require.Equal(t, newpayment.PaymentCategory, payment.PaymentCategory)
	require.Equal(t, newpayment.Bankname, payment.Bankname)
	require.Equal(t, newpayment.AccountID, payment.AccountID)
	require.Equal(t, newpayment.IBAN, payment.IBAN)
	require.Equal(t, newpayment.BIC, payment.BIC)
	require.Equal(t, newpayment.PaypalAccount, payment.PaypalAccount)
	require.Equal(t, newpayment.PaymentSystem, payment.PaymentSystem)
	require.Equal(t, newpayment.PaypalID, payment.PaypalID)
	require.Equal(t, newpayment.Creator, payment.Creator)
	require.Equal(t, newpayment.Type, payment.Type)

	require.WithinDuration(t, newpayment.Created, payment.Created, time.Second)
}

func TestDeletePayment(t *testing.T) {
	payment1 := createRandomPayment(t)
	err := testQueries.DeletePayment(context.Background(), payment1.ID)
	require.NoError(t, err)

	payment2, err := testQueries.GetPayment(context.Background(), payment1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, payment2)
}
