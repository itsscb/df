package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomPerson(t *testing.T) Person {
	account := createRandomAccount(t)
	require.NotEmpty(t, account)

	creator := util.RandomName()

	arg := CreatePersonParams{
		AccountID: account.ID,
		Firstname: util.RandomName(),
		Lastname:  util.RandomName(),
		Birthday:  time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		City:      util.RandomString(15),
		Zip:       util.RandomString(5),
		Street:    util.RandomString(20),
		Country:   util.RandomString(15),
		Creator:   creator,
		Changer:   creator,
	}

	person, err := testQueries.CreatePerson(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, person)

	require.Equal(t, arg.AccountID, person.AccountID)
	require.Equal(t, arg.Firstname, person.Firstname)
	require.Equal(t, arg.Lastname, person.Lastname)
	require.Equal(t, arg.Birthday, person.Birthday)
	require.Equal(t, arg.City, person.City)
	require.Equal(t, arg.Zip, person.Zip)
	require.Equal(t, arg.Street, person.Street)
	require.Equal(t, arg.Country, person.Country)
	require.Equal(t, arg.Creator, person.Creator)

	require.NotZero(t, person.ID)
	require.NotZero(t, person.Created)

	return person
}

func TestCreatePerson(t *testing.T) {
	createRandomPerson(t)
}

func TestGetPerson(t *testing.T) {
	newperson := createRandomPerson(t)
	require.NotEmpty(t, newperson)

	person, err := testQueries.GetPerson(context.Background(), newperson.ID)
	require.NoError(t, err)
	require.NotEmpty(t, person)

	require.Equal(t, newperson.Firstname, person.Firstname)
	require.Equal(t, newperson.Lastname, person.Lastname)
	require.Equal(t, newperson.Birthday, person.Birthday)
	require.Equal(t, newperson.City, person.City)
	require.Equal(t, newperson.Zip, person.Zip)
	require.Equal(t, newperson.Street, person.Street)
	require.Equal(t, newperson.Country, person.Country)
	require.Equal(t, newperson.Creator, person.Creator)

	require.WithinDuration(t, newperson.Created, person.Created, time.Second)
}

func TestDeletePerson(t *testing.T) {
	person1 := createRandomPerson(t)
	err := testQueries.DeletePerson(context.Background(), person1.ID)
	require.NoError(t, err)

	person2, err := testQueries.GetPerson(context.Background(), person1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, person2)
}

func TestUpdatePerson(t *testing.T) {
	person1 := createRandomPerson(t)
	require.NotEmpty(t, person1)

	arg := UpdatePersonParams{
		ID: person1.ID,
		Lastname: sql.NullString{
			String: util.RandomPhone(),
			Valid:  true,
		},
	}

	person2, err := testQueries.UpdatePerson(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, person2)

	require.Equal(t, person1.ID, person2.ID)
	require.Equal(t, person1.Firstname, person2.Firstname)
	require.NotEqual(t, person1.Lastname, person2.Lastname)
}

func TestListPersons(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomPerson(t)
	}

	arg := ListPersonsParams{
		Limit:  5,
		Offset: 5,
	}

	persons, err := testQueries.ListPersons(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, persons, 5)

	for _, person := range persons {
		require.NotEmpty(t, person)
	}
}
