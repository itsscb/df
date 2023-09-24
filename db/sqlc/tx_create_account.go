package db

import (
	"context"
	"database/sql"
	"time"
)

type CreateAccountTxParams struct {
	Passwordhash string         `json:"passwordhash"`
	Firstname    string         `json:"firstname"`
	Lastname     string         `json:"lastname"`
	Birthday     time.Time      `json:"birthday"`
	Email        string         `json:"email"`
	Phone        sql.NullString `json:"phone"`
	City         string         `json:"city"`
	Zip          string         `json:"zip"`
	Street       string         `json:"street"`
	Country      string         `json:"country"`
	Creator      string         `json:"creator"`
}

type CreateAccountTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) CreateAccountTx(ctx context.Context, arg CreateAccountTxParams) (CreateAccountTxResult, error) {
	var result CreateAccountTxResult

	err := store.execTx(ctx, func(q *Queries) error {
		var err error

		result.Account, err = q.CreateAccount(ctx, CreateAccountParams(arg)) //{
		// Passwordhash: arg.Passwordhash,
		// Firstname:    arg.Firstname,
		// Lastname:     arg.Lastname,
		// Birthday:     arg.Birthday,
		// City:         arg.City,
		// Zip:          arg.Zip,
		// Street:       arg.Street,
		// Country:      arg.Country,
		// Creator:      arg.Creator,
		// Phone:        arg.Phone,
		// Email:        arg.Email,
		// })

		return err
	})

	return result, err
}
