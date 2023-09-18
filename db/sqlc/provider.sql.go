// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: provider.sql

package db

import (
	"context"
	"database/sql"
)

const createProvider = `-- name: CreateProvider :one
INSERT INTO providers (
    name,
    description,
    category,
    email,
    creator,
    changer
) VALUES (
    $1, $2, $3, $4, $5, $6
) RETURNING "ID", name, description, category, email, creator, created, changer, changed
`

type CreateProviderParams struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Category    string `json:"category"`
	Email       string `json:"email"`
	Creator     string `json:"creator"`
	Changer     string `json:"changer"`
}

func (q *Queries) CreateProvider(ctx context.Context, arg CreateProviderParams) (Provider, error) {
	row := q.db.QueryRowContext(ctx, createProvider,
		arg.Name,
		arg.Description,
		arg.Category,
		arg.Email,
		arg.Creator,
		arg.Changer,
	)
	var i Provider
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.Description,
		&i.Category,
		&i.Email,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deleteProvider = `-- name: DeleteProvider :exec
DELETE FROM providers
WHERE "ID" = $1
`

func (q *Queries) DeleteProvider(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteProvider, id)
	return err
}

const getProvider = `-- name: GetProvider :one
SELECT "ID", name, description, category, email, creator, created, changer, changed FROM providers
WHERE "ID" = $1 LIMIT 1
`

func (q *Queries) GetProvider(ctx context.Context, id int64) (Provider, error) {
	row := q.db.QueryRowContext(ctx, getProvider, id)
	var i Provider
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.Description,
		&i.Category,
		&i.Email,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const listProviders = `-- name: ListProviders :many
SELECT "ID", name, description, category, email, creator, created, changer, changed FROM providers
ORDER BY name
LIMIT $1
OFFSET $2
`

type ListProvidersParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListProviders(ctx context.Context, arg ListProvidersParams) ([]Provider, error) {
	rows, err := q.db.QueryContext(ctx, listProviders, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Provider{}
	for rows.Next() {
		var i Provider
		if err := rows.Scan(
			&i.ID,
			&i.Name,
			&i.Description,
			&i.Category,
			&i.Email,
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

const updateProvider = `-- name: UpdateProvider :one
UPDATE providers
SET
    name = COALESCE($3, name),
    description = COALESCE($4, description),
    category = COALESCE($5, category),
    email = COALESCE($6, email),
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING "ID", name, description, category, email, creator, created, changer, changed
`

type UpdateProviderParams struct {
	ID          int64          `json:"ID"`
	Changer     string         `json:"changer"`
	Name        sql.NullString `json:"name"`
	Description sql.NullString `json:"description"`
	Category    sql.NullString `json:"category"`
	Email       sql.NullString `json:"email"`
}

func (q *Queries) UpdateProvider(ctx context.Context, arg UpdateProviderParams) (Provider, error) {
	row := q.db.QueryRowContext(ctx, updateProvider,
		arg.ID,
		arg.Changer,
		arg.Name,
		arg.Description,
		arg.Category,
		arg.Email,
	)
	var i Provider
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.Description,
		&i.Category,
		&i.Email,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}
