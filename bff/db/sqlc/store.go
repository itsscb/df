package db

import (
	"context"
	"database/sql"
	"fmt"

	"google.golang.org/grpc/codes"
)

type Store interface {
	Querier
	CreateAccountTx(ctx context.Context, arg CreateAccountTxParams) (Account, error)
	UpdateAccountTx(ctx context.Context, arg UpdateAccountTxParams) (Account, error)
	UpdateAccountPrivacyTx(ctx context.Context, arg UpdateAccountPrivacyTxParams) (Account, error)
	CreatePersonTx(ctx context.Context, arg CreatePersonTxParams) (Person, error)
	DeletePersonTx(ctx context.Context, id uint64) error
	CreateDocumentTx(ctx context.Context, arg CreateDocumentTxParams) (doc Document, code int, err error)
	DeleteDocumentTx(ctx context.Context, id uint64) (code codes.Code, err error)
	Query(ctx context.Context, statement string, args ...interface{}) (result []map[string]interface{}, err error)
}

// Store provides all functions to execute db queries and transactions
type SQLStore struct {
	*Queries
	db *sql.DB
}

func NewStore(db *sql.DB) Store {
	return &SQLStore{
		db:      db,
		Queries: New(db),
	}
}

// execTx executes a function within a database transaction
func (store *SQLStore) execTx(ctx context.Context, fn func(*Queries) error) error {
	tx, err := store.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	}

	q := New(tx)
	err = fn(q)
	if err != nil {
		if rbErr := tx.Rollback(); rbErr != nil {
			return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
		}
		return err
	}

	return tx.Commit()
}
