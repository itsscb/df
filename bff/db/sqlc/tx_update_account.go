package db

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

type UpdateAccountTxParams struct {
	UpdateAccountParams
	AfterUpdate func(Account) error
}

type UpdateAccountTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) UpdateAccountTx(ctx context.Context, arg UpdateAccountTxParams) (Account, error) {
	var result UpdateAccountTxResult
	var err error

	uid, _ := uuid.NewUUID()

	arg.SecretKey = sql.NullString{
		Valid:  uid.String() != "",
		String: uid.String(),
	}

	err = store.execTx(ctx, func(q *Queries) error {
		var err error

		result.Account, err = q.UpdateAccount(ctx, arg.UpdateAccountParams)
		if err != nil {
			return err
		}

		return arg.AfterUpdate(result.Account)
	})

	return result.Account, err
}
