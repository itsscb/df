package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomReturnsLog(t *testing.T) ReturnsLog {

	ret := createRandomReturn(t)
	mail := createRandomMail(t)

	creator := util.RandomUser()

	arg := CreateReturnsLogParams{
		Returnid: ret.ID,
		Mailid:   mail.ID,
		Status: sql.NullString{
			Valid:  true,
			String: util.RandomString(7),
		},
		Creator: creator,
	}

	returnsLog, err := testQueries.CreateReturnsLog(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, returnsLog)

	require.Equal(t, arg.Returnid, returnsLog.ReturnID)
	require.Equal(t, arg.Mailid, returnsLog.MailID)
	require.Equal(t, arg.Status, returnsLog.Status)
	require.Equal(t, arg.Creator, returnsLog.Creator)

	require.NotZero(t, returnsLog.ID)
	require.NotZero(t, returnsLog.Created)

	return returnsLog
}

func TestCreateReturnsLog(t *testing.T) {
	createRandomReturnsLog(t)
}

func TestGetReturnsLog(t *testing.T) {
	newReturnsLog := createRandomReturnsLog(t)
	require.NotEmpty(t, newReturnsLog)

	returnsLog, err := testQueries.GetReturnsLog(context.Background(), newReturnsLog.ID)
	require.NoError(t, err)
	require.NotEmpty(t, returnsLog)

	require.Equal(t, newReturnsLog.ReturnID, returnsLog.ReturnID)
	require.Equal(t, newReturnsLog.MailID, returnsLog.MailID)
	require.Equal(t, newReturnsLog.Status, returnsLog.Status)
	require.Equal(t, newReturnsLog.Created, returnsLog.Created)
	require.Equal(t, newReturnsLog.Changer, returnsLog.Changer)
	require.Equal(t, newReturnsLog.Changed, returnsLog.Changed)
	require.Equal(t, newReturnsLog.Creator, returnsLog.Creator)

	require.WithinDuration(t, newReturnsLog.Created, returnsLog.Created, time.Second)
}

func TestDeleteReturnsLog(t *testing.T) {
	returnsLog1 := createRandomReturnsLog(t)
	err := testQueries.DeleteReturnsLog(context.Background(), returnsLog1.ID)
	require.NoError(t, err)

	returnsLog2, err := testQueries.GetReturnsLog(context.Background(), returnsLog1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, returnsLog2)
}

func TestUpdateReturnsLog(t *testing.T) {
	returnsLog1 := createRandomReturnsLog(t)
	require.NotEmpty(t, returnsLog1)

	status := util.RandomString(15)

	arg := UpdateReturnsLogParams{
		ID: returnsLog1.ID,
		Status: sql.NullString{
			String: status,
			Valid:  true,
		},
	}

	returnsLog2, err := testQueries.UpdateReturnsLog(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, returnsLog2)

	require.Equal(t, returnsLog1.ID, returnsLog2.ID)
	require.Equal(t, returnsLog2.ReturnID, returnsLog1.ReturnID)
	require.NotEqual(t, returnsLog1.Status, returnsLog2.Status)
	require.NotEqual(t, returnsLog1.Changed, returnsLog2.Changed)
	require.NotEqual(t, returnsLog1.Changer, returnsLog2.Changer)
}

func TestListReturnsLogs(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomReturnsLog(t)
	}

	arg := ListReturnsLogsParams{
		Limit:  5,
		Offset: 5,
	}

	returnsLogs, err := testQueries.ListReturnsLogs(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, returnsLogs, 5)

	for _, returnsLog := range returnsLogs {
		require.NotEmpty(t, returnsLog)
	}
}
