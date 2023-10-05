// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: person.sql

package db

import (
	"context"
	"database/sql"
	"time"
)

const createPerson = `-- name: CreatePerson :one
INSERT INTO persons (
    "account_id",
    "firstname",
    "lastname",
    "birthday",
    "city",
    "zip",
    "street",
    "country",
    "creator",
    "changer"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
) RETURNING id, account_id, firstname, lastname, birthday, city, zip, street, country, creator, created, changer, changed
`

type CreatePersonParams struct {
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

func (q *Queries) CreatePerson(ctx context.Context, arg CreatePersonParams) (Person, error) {
	row := q.db.QueryRowContext(ctx, createPerson,
		arg.AccountID,
		arg.Firstname,
		arg.Lastname,
		arg.Birthday,
		arg.City,
		arg.Zip,
		arg.Street,
		arg.Country,
		arg.Creator,
		arg.Changer,
	)
	var i Person
	err := row.Scan(
		&i.ID,
		&i.AccountID,
		&i.Firstname,
		&i.Lastname,
		&i.Birthday,
		&i.City,
		&i.Zip,
		&i.Street,
		&i.Country,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deletePerson = `-- name: DeletePerson :exec
DELETE FROM persons
WHERE "id" = $1
`

func (q *Queries) DeletePerson(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deletePerson, id)
	return err
}

const getPerson = `-- name: GetPerson :one
SELECT id, account_id, firstname, lastname, birthday, city, zip, street, country, creator, created, changer, changed FROM persons
WHERE "id" = $1 LIMIT 1
`

func (q *Queries) GetPerson(ctx context.Context, id int64) (Person, error) {
	row := q.db.QueryRowContext(ctx, getPerson, id)
	var i Person
	err := row.Scan(
		&i.ID,
		&i.AccountID,
		&i.Firstname,
		&i.Lastname,
		&i.Birthday,
		&i.City,
		&i.Zip,
		&i.Street,
		&i.Country,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const getReturns = `-- name: GetReturns :many
SELECT id, person_id, provider_id, name, description, category, email, status, creator, created, changer, changed FROM returns
WHERE "person_id" = $1
`

func (q *Queries) GetReturns(ctx context.Context, id int64) ([]Return, error) {
	rows, err := q.db.QueryContext(ctx, getReturns, id)
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

const listPersons = `-- name: ListPersons :many
SELECT id, account_id, firstname, lastname, birthday, city, zip, street, country, creator, created, changer, changed FROM persons
ORDER BY "lastname", "firstname"
LIMIT $1
OFFSET $2
`

type ListPersonsParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListPersons(ctx context.Context, arg ListPersonsParams) ([]Person, error) {
	rows, err := q.db.QueryContext(ctx, listPersons, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Person{}
	for rows.Next() {
		var i Person
		if err := rows.Scan(
			&i.ID,
			&i.AccountID,
			&i.Firstname,
			&i.Lastname,
			&i.Birthday,
			&i.City,
			&i.Zip,
			&i.Street,
			&i.Country,
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

const updatePerson = `-- name: UpdatePerson :one
UPDATE persons
SET
    "account_id" = COALESCE($3, "account_id"),
    "firstname" = COALESCE($4, "firstname"),
    "lastname" = COALESCE($5, "lastname"),
    "birthday" = COALESCE($6, "birthday"),
    "city" = COALESCE($7, "city"),
    "zip" = COALESCE($8, "zip"),
    "street" = COALESCE($9, "street"),
    "country" = COALESCE($10, "country"),
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING id, account_id, firstname, lastname, birthday, city, zip, street, country, creator, created, changer, changed
`

type UpdatePersonParams struct {
	ID        int64          `json:"id"`
	Changer   string         `json:"changer"`
	AccountID sql.NullInt64  `json:"account_id"`
	Firstname sql.NullString `json:"firstname"`
	Lastname  sql.NullString `json:"lastname"`
	Birthday  sql.NullTime   `json:"birthday"`
	City      sql.NullString `json:"city"`
	Zip       sql.NullString `json:"zip"`
	Street    sql.NullString `json:"street"`
	Country   sql.NullString `json:"country"`
}

func (q *Queries) UpdatePerson(ctx context.Context, arg UpdatePersonParams) (Person, error) {
	row := q.db.QueryRowContext(ctx, updatePerson,
		arg.ID,
		arg.Changer,
		arg.AccountID,
		arg.Firstname,
		arg.Lastname,
		arg.Birthday,
		arg.City,
		arg.Zip,
		arg.Street,
		arg.Country,
	)
	var i Person
	err := row.Scan(
		&i.ID,
		&i.AccountID,
		&i.Firstname,
		&i.Lastname,
		&i.Birthday,
		&i.City,
		&i.Zip,
		&i.Street,
		&i.Country,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}
