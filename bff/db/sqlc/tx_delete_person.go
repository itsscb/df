package db

import (
	"context"
	"database/sql"
)

func (store *SQLStore) DeletePersonTx(ctx context.Context, id uint64) error {
	err := store.execTx(ctx, func(q *Queries) error {
		err := q.DeleteDocumentsByPersonID(ctx, sql.NullInt64{
			Valid: id > 0,
			Int64: int64(id),
		})
		if err != nil {
			return err
		}

		err = q.DeleteAllEmailAddresses(ctx, id)
		if err != nil {
			return err
		}

		err = q.DeleteAllPhoneNumbers(ctx, id)
		if err != nil {
			return err
		}

		err = q.DeleteReturnsLogsByPersonID(ctx, id)
		if err != nil {
			return err
		}

		err = q.DeleteReturnsByPersonID(ctx, id)
		if err != nil {
			return err
		}

		err = q.DeletePerson(ctx, id)
		if err != nil {
			return err
		}

		return err
	})

	return err
}
