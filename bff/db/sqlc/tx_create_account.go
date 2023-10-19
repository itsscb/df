package db

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

type CreateAccountTxParams struct {
	CreateAccountParams
	AfterCreate func(Account) error
}

type CreateAccountTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) CreateAccountTx(ctx context.Context, arg CreateAccountTxParams) (Account, error) {
	var result CreateAccountTxResult
	var err error

	uid, _ := uuid.NewUUID()

	arg.SecretKey = sql.NullString{
		Valid:  uid.String() != "",
		String: uid.String(),
	}

	// arg.Passwordhash, err = util.HashPassword(arg.Passwordhash)
	// if err != nil {
	// 	return Account{}, nil
	// }

	err = store.execTx(ctx, func(q *Queries) error {
		var err error

		result.Account, err = q.CreateAccount(ctx, arg.CreateAccountParams)
		if err != nil {
			return err
		}

		return arg.AfterCreate(result.Account)
	})

	return result.Account, err
}
