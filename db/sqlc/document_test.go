package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
)

func createRandomDocumentUpload(t *testing.T) Document {
	person := createRandomPerson(t)
	require.NotEmpty(t, person)

	arg := CreateDocumentUploadParams{
		PersonID: sql.NullInt64{
			Valid: true,
			Int64: person.ID,
		},
		Name:    util.RandomUser(),
		Type:    util.RandomUser(),
		Path:    util.RandomString(50),
		Url:     util.RandomString(60),
		Creator: util.RandomUser(),
		Changer: util.RandomUser(),
	}

	document, err := testQueries.CreateDocumentUpload(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, document)

	require.Equal(t, arg.PersonID, document.PersonID)
	require.Equal(t, arg.Name, document.Name)
	require.Equal(t, arg.Type, document.Type)
	require.Equal(t, arg.Path, document.Path)
	require.Equal(t, arg.Url, document.Url)
	require.Equal(t, arg.Creator, document.Creator)
	require.Equal(t, arg.Changer, document.Changer)
	require.Equal(t, false, document.Valid)
	require.Zero(t, document.ValidatedBy)
	require.Zero(t, document.ValidDate)

	require.NotZero(t, document.ID)
	require.NotZero(t, document.Created)

	return document
}

func TestCreateDocumentUpload(t *testing.T) {
	createRandomDocumentUpload(t)
}

func TestGetDocument(t *testing.T) {
	newdocument := createRandomDocumentUpload(t)
	require.NotEmpty(t, newdocument)

	document, err := testQueries.GetDocument(context.Background(), newdocument.ID)
	require.NoError(t, err)
	require.NotEmpty(t, document)

	require.Equal(t, newdocument.Name, document.Name)
	require.Equal(t, newdocument.ID, document.ID)
	require.Equal(t, newdocument.PersonID, document.PersonID)
	require.Equal(t, newdocument.Type, document.Type)
	require.Equal(t, newdocument.Url, document.Url)
	require.Equal(t, newdocument.Path, document.Path)
	require.Equal(t, newdocument.Valid, document.Valid)
	require.Equal(t, newdocument.ValidDate, document.ValidDate)
	require.Equal(t, newdocument.ValidatedBy, document.ValidatedBy)
	require.Equal(t, newdocument.Creator, document.Creator)

	require.WithinDuration(t, newdocument.Created, document.Created, time.Second)
}

func TestDeleteDocument(t *testing.T) {
	document1 := createRandomDocumentUpload(t)
	err := testQueries.DeleteDocument(context.Background(), document1.ID)
	require.NoError(t, err)

	document2, err := testQueries.GetDocument(context.Background(), document1.ID)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, document2)
}

func TestUpdateDocument(t *testing.T) {
	document1 := createRandomDocumentUpload(t)
	require.NotEmpty(t, document1)

	arg := UpdateDocumentParams{
		ID: document1.ID,
		Name: sql.NullString{
			String: util.RandomString(50),
			Valid:  true,
		},
	}

	document2, err := testQueries.UpdateDocument(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, document2)

	require.Equal(t, document1.ID, document2.ID)
	require.Equal(t, document1.Path, document2.Path)
	require.NotEqual(t, document1.Name, document2.Name)
}

func TestListDocuments(t *testing.T) {
	for i := 0; i < 10; i++ {
		createRandomDocumentUpload(t)
	}

	arg := ListDocumentsParams{
		Limit:  5,
		Offset: 5,
	}

	documents, err := testQueries.ListDocuments(context.Background(), arg)
	require.NoError(t, err)
	require.Len(t, documents, 5)

	for _, document := range documents {
		require.NotEmpty(t, document)
	}
}

func TestValidateDocument(t *testing.T) {
	document1 := createRandomDocumentUpload(t)

	validator := util.RandomUser()

	arg := ValidateDocumentParams{
		ID: document1.ID,
		ValidatedBy: sql.NullString{
			Valid:  true,
			String: validator,
		},
	}

	document2, err := testQueries.ValidateDocument(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, document2)

	require.NotEqual(t, document2.Valid, document1.Valid)
	require.NotEqual(t, document2.ValidatedBy, document1.ValidatedBy)
	require.NotEqual(t, document2.ValidDate, document1.ValidDate)

	require.Equal(t, document2.ValidatedBy.String, document2.Changer)
	require.Equal(t, document2.ValidatedBy.String, validator)
}

func TestInvalidateDocument(t *testing.T) {
	document1 := createRandomDocumentUpload(t)

	validator := util.RandomUser()

	arg := ValidateDocumentParams{
		ID: document1.ID,
		ValidatedBy: sql.NullString{
			Valid:  true,
			String: validator,
		},
	}

	document2, err := testQueries.ValidateDocument(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, document2)

	invalidator := util.RandomUser()

	arg2 := InvalidateDocumentParams{
		ID:      document2.ID,
		Changer: invalidator,
	}

	document3, err := testQueries.InvalidateDocument(context.Background(), arg2)
	require.NoError(t, err)
	require.NotEmpty(t, document3)

	require.NotEqual(t, document3.Valid, document2.Valid)
	require.NotEqual(t, document3.ValidatedBy, document2.ValidatedBy)
	require.NotEqual(t, document3.ValidDate, document2.ValidDate)

	require.Zero(t, document3.ValidatedBy.String)
	require.Equal(t, document3.Changer, invalidator)
}
