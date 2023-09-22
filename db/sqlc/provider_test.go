package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomProvider(t *testing.T) Provider {

	creator := util.RandomName()

	arg := CreateProviderParams{
		Name:        util.RandomName(),
		Description: util.RandomString(30),
		Category:    util.RandomName(),
		Email:       util.RandomName(),
		Creator:     creator,
		Changer:     creator,
	}

	provider, err := testQueries.CreateProvider(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, provider)

	require.Equal(t, arg.Name, provider.Name)
	require.Equal(t, arg.Description, provider.Description)
	require.Equal(t, arg.Category, provider.Category)
	require.Equal(t, arg.Email, provider.Email)
	require.Equal(t, arg.Creator, provider.Creator)

	require.NotZero(t, provider.ID)
	require.NotZero(t, provider.Created)

	return provider
}

func TestCreateProvider(t *testing.T) {
	createRandomProvider(t)
}

func TestGetProvider(t *testing.T) {
	newProvider := createRandomProvider(t)
	require.NotEmpty(t, newProvider)

	provider, err := testQueries.GetProvider(context.Background(), newProvider.ID)
	require.NoError(t, err)
	require.NotEmpty(t, provider)

	require.Equal(t, newProvider.Name, provider.Name)
	require.Equal(t, newProvider.Description, provider.Description)
	require.Equal(t, newProvider.Category, provider.Category)
	require.Equal(t, newProvider.Email, provider.Email)
	require.Equal(t, newProvider.Created, provider.Created)
	require.Equal(t, newProvider.Changer, provider.Changer)
	require.Equal(t, newProvider.Changed, provider.Changed)
	require.Equal(t, newProvider.Creator, provider.Creator)

	require.WithinDuration(t, newProvider.Created, provider.Created, time.Second)
}

func TestDeleteProvider(t *testing.T) {
	provider1 := createRandomProvider(t)
	err := testQueries.DeleteProvider(context.Background(), provider1.ID)
	require.NoError(t, err)

	provider2, err := testQueries.GetProvider(context.Background(), provider1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, provider2)
}

func TestUpdateProvider(t *testing.T) {
	provider1 := createRandomProvider(t)
	require.NotEmpty(t, provider1)

	newName := util.RandomString(15)

	arg := UpdateProviderParams{
		ID: provider1.ID,
		Name: sql.NullString{
			String: newName,
			Valid:  true,
		},
	}

	provider2, err := testQueries.UpdateProvider(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, provider2)

	require.Equal(t, provider1.ID, provider2.ID)
	require.Equal(t, provider2.Name, newName)
	require.Equal(t, provider2.Description, provider1.Description)
	require.NotEqual(t, provider1.Name, provider2.Name)
}

func TestListProviders(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomProvider(t)
	}

	arg := ListProvidersParams{
		Limit:  5,
		Offset: 5,
	}

	providers, err := testQueries.ListProviders(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, providers, 5)

	for _, provider := range providers {
		require.NotEmpty(t, provider)
	}
}
