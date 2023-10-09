package db

import (
	"context"
	"time"
)

type CreatePersonTxParams struct {
	AccountID int64     `json:"account_id"`
	Firstname string    `json:"firstname"`
	Lastname  string    `json:"lastname"`
	Birthday  time.Time `json:"birthday"`
	City      string    `json:"city"`
	Zip       string    `json:"zip"`
	Street    string    `json:"street"`
	Country   string    `json:"country"`
	Creator   string    `json:"creator"`
	Changer   string    `json:"changer"`
}

type CreatePersonTxResult struct {
	Person Person `json:"person"`
}

func (store *SQLStore) CreatePersonTx(ctx context.Context, arg CreatePersonTxParams) (Person, error) {
	var result CreatePersonTxResult

	err := store.execTx(ctx, func(q *Queries) error {
		var err error

		result.Person, err = q.CreatePerson(ctx, CreatePersonParams(arg))
		if err != nil {
			return err
		}

		err = q.CloneProviders(ctx, CloneProvidersParams{
			Creator:  arg.Creator,
			PersonID: int64(result.Person.ID),
		})
		return err
	})

	return result.Person, err
}
