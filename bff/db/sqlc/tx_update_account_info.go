package db

import (
	"context"
	"database/sql"
)

type UpdateAccountInfoTxParams struct {
	AccountID uint64         `json:"account_id"`
	Changer   string         `json:"changer"`
	Firstname sql.NullString `json:"firstname"`
	Lastname  sql.NullString `json:"lastname"`
	Birthday  sql.NullTime   `json:"birthday"`
	Phone     sql.NullString `json:"phone"`
	City      sql.NullString `json:"city"`
	Zip       sql.NullString `json:"zip"`
	Street    sql.NullString `json:"street"`
	Country   sql.NullString `json:"country"`
}

type UpdateAccountInfoTxResult struct {
	AccountInfo AccountInfo `json:"account_info"`
}

func (store *SQLStore) UpdateAccountInfoTx(ctx context.Context, arg UpdateAccountInfoTxParams) (AccountInfo, error) {
	var result UpdateAccountInfoTxResult

	// if arg.Passwordhash.Valid {
	// 	arg.Passwordhash.String, err = util.HashPassword(arg.Passwordhash.String)
	// 	if err != nil {
	// 		return Account{}, nil
	// 	}
	// }

	err := store.execTx(ctx, func(q *Queries) error {
		var err error
		result.AccountInfo, err = q.UpdateAccountInfo(ctx, UpdateAccountInfoParams(arg))
		return err
	})

	return result.AccountInfo, err
}
