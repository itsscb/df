package db

import (
	"context"
	"database/sql"
	"log/slog"
)

var (
	restrictedFields = map[string]bool{
		"passwordhash": true,
	}
)

func (store *SQLStore) Query(ctx context.Context, statement string, args ...interface{}) (result []map[string]interface{}, err error) {
	var rows *sql.Rows
	// var err error

	if len(args) > 0 {
		rows, err = store.db.QueryContext(ctx, statement, args)
	} else {
		rows, err = store.db.QueryContext(ctx, statement)
	}
	if err != nil {
		slog.Error("db_query", slog.String("statement", statement), slog.String("error", err.Error()))
		return nil, err
	}

	cols, err := rows.Columns()
	if err != nil {
		slog.Error("db_query: getting columns", slog.String("error", err.Error()))
		return nil, err
	}

	for rows.Next() {
		values := make([]interface{}, len(cols))
		res := make(map[string]interface{})
		for i := range values {
			values[i] = new(interface{})
		}
		err = rows.Scan(values...)
		if err != nil {
			slog.Error("db_query: scanning rows", slog.String("error", err.Error()))
			return nil, err
		}
		for i, col := range cols {
			if restrictedFields[col] {
				continue
			}
			res[col] = *(values[i].(*interface{}))
		}

		result = append(result, res)
	}

	return result, rows.Err()
}
