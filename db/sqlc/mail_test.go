package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomMail(t *testing.T) Mail {

	creator := util.RandomName()

	arg := CreateMailParams{
		From:      util.RandomEmail(),
		To:        []string{util.RandomEmail()},
		Cc:        []string{util.RandomEmail()},
		Subject:   util.RandomString(20),
		Body:      util.RandomString(300),
		Timestamp: time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Creator:   creator,
		Changer:   creator,
	}

	mail, err := testQueries.CreateMail(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, mail)

	require.Equal(t, arg.From, mail.From)
	require.Equal(t, arg.To, mail.To)
	require.Equal(t, arg.Subject, mail.Subject)
	require.Equal(t, arg.Body, mail.Body)
	require.Equal(t, arg.Timestamp, mail.Timestamp)
	require.Equal(t, arg.Creator, mail.Creator)
	require.Equal(t, arg.Changer, mail.Changer)

	require.NotZero(t, mail.ID)
	require.NotZero(t, mail.Created)

	return mail
}

func TestCreateMail(t *testing.T) {
	createRandomMail(t)
}

func TestGetMail(t *testing.T) {
	newmail := createRandomMail(t)
	require.NotEmpty(t, newmail)

	mail, err := testQueries.GetMail(context.Background(), newmail.ID)
	require.NoError(t, err)
	require.NotEmpty(t, mail)

	require.Equal(t, newmail.From, mail.From)
	require.Equal(t, newmail.To, mail.To)
	require.Equal(t, newmail.Subject, mail.Subject)
	require.Equal(t, newmail.Body, mail.Body)
	require.Equal(t, newmail.Timestamp, mail.Timestamp)
	require.Equal(t, newmail.Creator, mail.Creator)
	require.Equal(t, newmail.Changer, mail.Changer)

	require.WithinDuration(t, newmail.Created, mail.Created, time.Second)
}

func TestDeleteMail(t *testing.T) {
	mail1 := createRandomMail(t)
	err := testQueries.DeleteMail(context.Background(), mail1.ID)
	require.NoError(t, err)

	mail2, err := testQueries.GetMail(context.Background(), mail1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, mail2)
}

/* func TestUpdateMail(t *testing.T) {
	mail1 := createRandomMail(t)
	require.NotEmpty(t, mail1)

	arg := UpdateMailParams{
		ID: mail1.ID,
		Name: sql.NullString{
			String: util.RandomString(50),
			Valid:  true,
		},
	}

	mail2, err := testQueries.UpdateMail(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, mail2)

	require.Equal(t, mail1.ID, mail2.ID)
	require.Equal(t, mail1.Path, mail2.Path)
	require.NotEqual(t, mail1.Name, mail2.Name)
} */

func TestListMails(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomMail(t)
	}

	arg := ListMailsParams{
		Limit:  5,
		Offset: 5,
	}

	mails, err := testQueries.ListMails(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, mails, 5)

	for _, mail := range mails {
		require.NotEmpty(t, mail)
	}
}
