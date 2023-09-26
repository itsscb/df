package db

import (
	"context"
	"database/sql"
	"time"
)

type UpdateAccountTxParams struct {
	ID                  int64          `json:"ID"`
	Changer             string         `json:"changer"`
	Passwordhash        sql.NullString `json:"passwordhash"`
	PrivacyAccepted     sql.NullBool   `json:"privacy_accepted"`
	PrivacyAcceptedDate sql.NullTime   `json:"privacy_accepted_date"`
	Firstname           sql.NullString `json:"firstname"`
	Lastname            sql.NullString `json:"lastname"`
	Birthday            sql.NullTime   `json:"birthday"`
	Email               sql.NullString `json:"email"`
	Phone               sql.NullString `json:"phone"`
	City                sql.NullString `json:"city"`
	Zip                 sql.NullString `json:"zip"`
	Street              sql.NullString `json:"street"`
	Country             sql.NullString `json:"country"`
}

type UpdateAccountTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) UpdateAccountTx(ctx context.Context, arg UpdateAccountTxParams) (Account, error) {
	var result UpdateAccountTxResult

	account, err := store.GetAccount(ctx, arg.ID)
	if err != nil {
		return Account{}, err
	}

	if arg.PrivacyAccepted.Bool && arg.PrivacyAccepted.Bool != account.PrivacyAccepted.Bool {
		arg.PrivacyAcceptedDate = sql.NullTime{
			Valid: true,
			Time:  time.Now(),
		}
	}

	if !account.PrivacyAccepted.Bool && !arg.PrivacyAccepted.Bool {
		arg.PrivacyAcceptedDate = sql.NullTime{
			Valid: true,
			Time:  time.Time{},
		}
	}

	err = store.execTx(ctx, func(q *Queries) error {
		var err error
		result.Account, err = q.UpdateAccount(ctx, UpdateAccountParams(arg))
		return err
	})

	return result.Account, err
}
