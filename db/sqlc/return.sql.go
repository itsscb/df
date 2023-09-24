// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: return.sql

package db

import (
	"context"
	"database/sql"
)

const createReturn = `-- name: CreateReturn :one
INSERT INTO returns (
    "personID",
    "providerID",
    "name",
    "description",
    "category",
    "email",
    "status",
    "creator",
    "changer"
) VALUES (
    $1,
    $2,
    $3,
    $4,
    $5,
    $6,
    $7,
    $8,
    $9
) RETURNING "ID", "personID", "providerID", name, description, category, email, status, creator, created, changer, changed
`

type CreateReturnParams struct {
	Personid    int64  `json:"personid"`
	Providerid  int64  `json:"providerid"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Category    string `json:"category"`
	Email       string `json:"email"`
	Status      string `json:"status"`
	Creator     string `json:"creator"`
	Changer     string `json:"changer"`
}

func (q *Queries) CreateReturn(ctx context.Context, arg CreateReturnParams) (Return, error) {
	row := q.db.QueryRowContext(ctx, createReturn,
		arg.Personid,
		arg.Providerid,
		arg.Name,
		arg.Description,
		arg.Category,
		arg.Email,
		arg.Status,
		arg.Creator,
		arg.Changer,
	)
	var i Return
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.ProviderID,
		&i.Name,
		&i.Description,
		&i.Category,
		&i.Email,
		&i.Status,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deleteReturn = `-- name: DeleteReturn :exec
DELETE FROM returns
WHERE "ID" = $1
`

func (q *Queries) DeleteReturn(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteReturn, id)
	return err
}

const getReturn = `-- name: GetReturn :one
SELECT "ID", "personID", "providerID", name, description, category, email, status, creator, created, changer, changed FROM returns
WHERE "ID" = $1 LIMIT 1
`

func (q *Queries) GetReturn(ctx context.Context, id int64) (Return, error) {
	row := q.db.QueryRowContext(ctx, getReturn, id)
	var i Return
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.ProviderID,
		&i.Name,
		&i.Description,
		&i.Category,
		&i.Email,
		&i.Status,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const listReturns = `-- name: ListReturns :many
SELECT "ID", "personID", "providerID", name, description, category, email, status, creator, created, changer, changed FROM returns
ORDER BY "name"
LIMIT $1
OFFSET $2
`

type ListReturnsParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListReturns(ctx context.Context, arg ListReturnsParams) ([]Return, error) {
	rows, err := q.db.QueryContext(ctx, listReturns, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Return{}
	for rows.Next() {
		var i Return
		if err := rows.Scan(
			&i.ID,
			&i.PersonID,
			&i.ProviderID,
			&i.Name,
			&i.Description,
			&i.Category,
			&i.Email,
			&i.Status,
			&i.Creator,
			&i.Created,
			&i.Changer,
			&i.Changed,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const updateReturn = `-- name: UpdateReturn :one
UPDATE returns
SET
    "personID" = COALESCE($1, "personID"),
    "providerID" = COALESCE($2, "providerID"),
    "name" = COALESCE($3, "name"),
    "description" = COALESCE($4, "description"),
    "category" = COALESCE($5, "category"),
    "email" = COALESCE($6, "email"),
    "status" = COALESCE($7, "status"),
    "changer" = $8,
    "changed" = now()
WHERE "ID" = $9
RETURNING "ID", "personID", "providerID", name, description, category, email, status, creator, created, changer, changed
`

type UpdateReturnParams struct {
	Personid    sql.NullInt64  `json:"personid"`
	Providerid  sql.NullInt64  `json:"providerid"`
	Name        sql.NullString `json:"name"`
	Description sql.NullString `json:"description"`
	Category    sql.NullString `json:"category"`
	Email       sql.NullString `json:"email"`
	Status      sql.NullString `json:"status"`
	Changer     string         `json:"changer"`
	ID          int64          `json:"id"`
}

func (q *Queries) UpdateReturn(ctx context.Context, arg UpdateReturnParams) (Return, error) {
	row := q.db.QueryRowContext(ctx, updateReturn,
		arg.Personid,
		arg.Providerid,
		arg.Name,
		arg.Description,
		arg.Category,
		arg.Email,
		arg.Status,
		arg.Changer,
		arg.ID,
	)
	var i Return
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.ProviderID,
		&i.Name,
		&i.Description,
		&i.Category,
		&i.Email,
		&i.Status,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}
