package db

import (
	"context"
	"database/sql"
	"time"
)

type CreateAccountTxParams struct {
	Passwordhash        string         `json:"passwordhash"`
	PrivacyAccepted     sql.NullBool   `json:"privacy_accepted"`
	PrivacyAcceptedDate sql.NullTime   `json:"privacy_accepted_date"`
	Firstname           string         `json:"firstname"`
	Lastname            string         `json:"lastname"`
	Birthday            time.Time      `json:"birthday"`
	Email               string         `json:"email"`
	Phone               sql.NullString `json:"phone"`
	City                string         `json:"city"`
	Zip                 string         `json:"zip"`
	Street              string         `json:"street"`
	Country             string         `json:"country"`
	Creator             string         `json:"creator"`
}

type CreateAccountTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) CreateAccountTx(ctx context.Context, arg CreateAccountTxParams) (Account, error) {
	var result CreateAccountTxResult
	var err error

	if arg.PrivacyAccepted.Bool && arg.PrivacyAccepted.Valid && !arg.PrivacyAcceptedDate.Valid {
		arg.PrivacyAcceptedDate = sql.NullTime{
			Valid: true,
			Time:  time.Now(),
		}
	}

	// arg.Passwordhash, err = util.HashPassword(arg.Passwordhash)
	// if err != nil {
	// 	return Account{}, nil
	// }

	err = store.execTx(ctx, func(q *Queries) error {
		var err error

		result.Account, err = q.CreateAccount(ctx, CreateAccountParams(arg))

		return err
	})

	return result.Account, err
}
