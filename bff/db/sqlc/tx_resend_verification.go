package db

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

type ResendVerificationTxParams struct {
	ResendVerificationParams
	AfterCreate func(Account) error
}

type ResendVerificationTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) ResendVerificationTx(ctx context.Context, arg ResendVerificationTxParams) (Account, error) {
	var result ResendVerificationTxResult
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

		result.Account, err = q.ResendVerification(ctx, arg.ResendVerificationParams)
		if err != nil {
			return err
		}

		return arg.AfterCreate(result.Account)
	})

	return result.Account, err
}
