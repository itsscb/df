package db

import (
	"context"
	"database/sql"
	"time"
)

type UpdateAccountPrivacyTxParams struct {
	ID              int64  `json:"ID"`
	Changer         string `json:"changer"`
	PrivacyAccepted bool   `json:"privacy_accepted"`
}

type UpdateAccountPrivacyTxResult struct {
	Account Account `json:"account"`
}

func (store *SQLStore) UpdateAccountPrivacyTx(ctx context.Context, arg UpdateAccountPrivacyTxParams) (Account, error) {
	var result UpdateAccountPrivacyTxResult
	param := UpdateAccountPrivacyParams{
		ID:      arg.ID,
		Changer: arg.Changer,
	}

	if arg.PrivacyAccepted {
		param.PrivacyAcceptedDate = sql.NullTime{
			Valid: true,
			Time:  time.Now(),
		}
	} else {
		param.PrivacyAcceptedDate = sql.NullTime{
			Valid: true,
			Time:  time.Time{},
		}

	}

	err := store.execTx(ctx, func(q *Queries) error {
		var err error
		result.Account, err = q.UpdateAccountPrivacy(ctx, param)
		return err
	})

	return result.Account, err
}
