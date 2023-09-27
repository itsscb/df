package db

import (
	"context"
	"database/sql"
)

type UpdateAccountTxParams struct {
	ID           int64          `json:"ID"`
	Changer      string         `json:"changer"`
	Passwordhash sql.NullString `json:"passwordhash"`
	Firstname    sql.NullString `json:"firstname"`
	Lastname     sql.NullString `json:"lastname"`
	Birthday     sql.NullTime   `json:"birthday"`
	Email        sql.NullString `json:"email"`
	Phone        sql.NullString `json:"phone"`
	City         sql.NullString `json:"city"`
	Zip          sql.NullString `json:"zip"`
	Street       sql.NullString `json:"street"`
	Country      sql.NullString `json:"country"`
}

type UpdateAccountTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) UpdateAccountTx(ctx context.Context, arg UpdateAccountTxParams) (Account, error) {
	var result UpdateAccountTxResult

	err := store.execTx(ctx, func(q *Queries) error {
		var err error
		result.Account, err = q.UpdateAccount(ctx, UpdateAccountParams(arg))
		return err
	})

	return result.Account, err
}
