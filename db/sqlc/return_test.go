package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomReturn(t *testing.T) Return {

	person := createRandomPerson(t)
	provider := createRandomProvider(t)

	creator := util.RandomUser()

	arg := CreateReturnParams{
		Personid:    person.ID,
		Providerid:  provider.ID,
		Status:      util.RandomString(7),
		Name:        util.RandomUser(),
		Description: util.RandomString(30),
		Category:    util.RandomUser(),
		Email:       util.RandomUser(),
		Creator:     creator,
		Changer:     creator,
	}

	ret, err := testQueries.CreateReturn(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, ret)

	require.Equal(t, arg.Name, ret.Name)
	require.Equal(t, arg.Personid, ret.PersonID)
	require.Equal(t, arg.Providerid, ret.ProviderID)
	require.Equal(t, arg.Description, ret.Description)
	require.Equal(t, arg.Category, ret.Category)
	require.Equal(t, arg.Status, ret.Status)
	require.Equal(t, arg.Email, ret.Email)
	require.Equal(t, arg.Creator, ret.Creator)

	require.NotZero(t, ret.ID)
	require.NotZero(t, ret.Created)

	return ret
}

func TestCreateReturn(t *testing.T) {
	createRandomReturn(t)
}

func TestGetReturn(t *testing.T) {
	newReturn := createRandomReturn(t)
	require.NotEmpty(t, newReturn)

	ret, err := testQueries.GetReturn(context.Background(), newReturn.ID)
	require.NoError(t, err)
	require.NotEmpty(t, ret)

	require.Equal(t, newReturn.Name, ret.Name)
	require.Equal(t, newReturn.PersonID, ret.PersonID)
	require.Equal(t, newReturn.ProviderID, ret.ProviderID)
	require.Equal(t, newReturn.Status, ret.Status)
	require.Equal(t, newReturn.Description, ret.Description)
	require.Equal(t, newReturn.Category, ret.Category)
	require.Equal(t, newReturn.Email, ret.Email)
	require.Equal(t, newReturn.Created, ret.Created)
	require.Equal(t, newReturn.Changer, ret.Changer)
	require.Equal(t, newReturn.Changed, ret.Changed)
	require.Equal(t, newReturn.Creator, ret.Creator)

	require.WithinDuration(t, newReturn.Created, ret.Created, time.Second)
}

func TestDeleteReturn(t *testing.T) {
	ret1 := createRandomReturn(t)
	err := testQueries.DeleteReturn(context.Background(), ret1.ID)
	require.NoError(t, err)

	ret2, err := testQueries.GetReturn(context.Background(), ret1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, ret2)
}

func TestUpdateReturn(t *testing.T) {
	ret1 := createRandomReturn(t)
	require.NotEmpty(t, ret1)

	newName := util.RandomString(15)

	arg := UpdateReturnParams{
		ID: ret1.ID,
		Name: sql.NullString{
			String: newName,
			Valid:  true,
		},
	}

	ret2, err := testQueries.UpdateReturn(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, ret2)

	require.Equal(t, ret1.ID, ret2.ID)
	require.Equal(t, ret2.Name, newName)
	require.Equal(t, ret2.Description, ret1.Description)
	require.NotEqual(t, ret1.Name, ret2.Name)
}

func TestListReturns(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomReturn(t)
	}

	arg := ListReturnsParams{
		Limit:  5,
		Offset: 5,
	}

	rets, err := testQueries.ListReturns(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, rets, 5)

	for _, ret := range rets {
		require.NotEmpty(t, ret)
	}
}
