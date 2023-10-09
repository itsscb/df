package db

import (
	"context"
)

func (store *SQLStore) DeletePersonTx(ctx context.Context, id int64) error {
	err := store.execTx(ctx, func(q *Queries) error {

		// TODO: Add removal of db.returnsLog entries.

		err := q.DeletePerson(ctx, id)
		if err != nil {
			return err
		}

		return err
	})

	return err
}
