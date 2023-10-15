package db

import (
	"context"
	"database/sql"
	"time"
)

type UpdateAccountPrivacyTxParams struct {
	ID              uint64 `json:"ID"`
	Changer         string `json:"changer"`
	PrivacyAccepted *bool  `json:"privacy_accepted"`
}

type UpdateAccountPrivacyTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) UpdateAccountPrivacyTx(ctx context.Context, arg UpdateAccountPrivacyTxParams) (Account, error) {
	var date sql.NullTime
	var account Account

	if *arg.PrivacyAccepted {
		date = sql.NullTime{
			Valid: true,
			Time:  time.Now(),
		}
	} else {
		date = sql.NullTime{
			Valid: true,
			Time:  time.Time{},
		}

	}

	err := store.execTx(ctx, func(q *Queries) error {
		var err error
		account, err = q.UpdateAccountPrivacy(ctx, UpdateAccountPrivacyParams{
			PrivacyAccepted: sql.NullBool{
				Bool:  *arg.PrivacyAccepted,
				Valid: true,
			},
			PrivacyAcceptedDate: date,
			ID:                  arg.ID,
			Changer:             arg.Changer,
		})
		return err
	})

	return account, err
}
