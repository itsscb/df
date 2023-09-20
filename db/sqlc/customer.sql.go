// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: customer.sql

package db

import (
	"context"
	"database/sql"
	"time"
)

const createCustomer = `-- name: CreateCustomer :one
INSERT INTO customers (
    username,
    passwordhash,
    firstname,
    lastname,
    birthday,
    email,
    phone,
    city,
    zip,
    street,
    country,
    creator,
    changer
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13
) RETURNING "ID", username, passwordhash, firstname, lastname, birthday, "privacyAccepted", "privacyAcceptedDate", email, phone, city, zip, street, country, token, "tokenValid", "tokenExpiration", creator, created, changer, changed
`

type CreateCustomerParams struct {
	Username     string         `json:"username"`
	Passwordhash string         `json:"passwordhash"`
	Firstname    string         `json:"firstname"`
	Lastname     string         `json:"lastname"`
	Birthday     time.Time      `json:"birthday"`
	Email        string         `json:"email"`
	Phone        sql.NullString `json:"phone"`
	City         string         `json:"city"`
	Zip          string         `json:"zip"`
	Street       string         `json:"street"`
	Country      string         `json:"country"`
	Creator      string         `json:"creator"`
	Changer      string         `json:"changer"`
}

func (q *Queries) CreateCustomer(ctx context.Context, arg CreateCustomerParams) (Customer, error) {
	row := q.db.QueryRowContext(ctx, createCustomer,
		arg.Username,
		arg.Passwordhash,
		arg.Firstname,
		arg.Lastname,
		arg.Birthday,
		arg.Email,
		arg.Phone,
		arg.City,
		arg.Zip,
		arg.Street,
		arg.Country,
		arg.Creator,
		arg.Changer,
	)
	var i Customer
	err := row.Scan(
		&i.ID,
		&i.Username,
		&i.Passwordhash,
		&i.Firstname,
		&i.Lastname,
		&i.Birthday,
		&i.PrivacyAccepted,
		&i.PrivacyAcceptedDate,
		&i.Email,
		&i.Phone,
		&i.City,
		&i.Zip,
		&i.Street,
		&i.Country,
		&i.Token,
		&i.TokenValid,
		&i.TokenExpiration,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deleteCustomer = `-- name: DeleteCustomer :exec
DELETE FROM customers
WHERE "ID" = $1
`

func (q *Queries) DeleteCustomer(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteCustomer, id)
	return err
}

const getCustomer = `-- name: GetCustomer :one
SELECT "ID", username, passwordhash, firstname, lastname, birthday, "privacyAccepted", "privacyAcceptedDate", email, phone, city, zip, street, country, token, "tokenValid", "tokenExpiration", creator, created, changer, changed FROM customers
WHERE "ID" = $1 LIMIT 1
`

func (q *Queries) GetCustomer(ctx context.Context, id int64) (Customer, error) {
	row := q.db.QueryRowContext(ctx, getCustomer, id)
	var i Customer
	err := row.Scan(
		&i.ID,
		&i.Username,
		&i.Passwordhash,
		&i.Firstname,
		&i.Lastname,
		&i.Birthday,
		&i.PrivacyAccepted,
		&i.PrivacyAcceptedDate,
		&i.Email,
		&i.Phone,
		&i.City,
		&i.Zip,
		&i.Street,
		&i.Country,
		&i.Token,
		&i.TokenValid,
		&i.TokenExpiration,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const listCustomers = `-- name: ListCustomers :many
SELECT "ID", username, passwordhash, firstname, lastname, birthday, "privacyAccepted", "privacyAcceptedDate", email, phone, city, zip, street, country, token, "tokenValid", "tokenExpiration", creator, created, changer, changed FROM customers
ORDER BY username
LIMIT $1
OFFSET $2
`

type ListCustomersParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListCustomers(ctx context.Context, arg ListCustomersParams) ([]Customer, error) {
	rows, err := q.db.QueryContext(ctx, listCustomers, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Customer{}
	for rows.Next() {
		var i Customer
		if err := rows.Scan(
			&i.ID,
			&i.Username,
			&i.Passwordhash,
			&i.Firstname,
			&i.Lastname,
			&i.Birthday,
			&i.PrivacyAccepted,
			&i.PrivacyAcceptedDate,
			&i.Email,
			&i.Phone,
			&i.City,
			&i.Zip,
			&i.Street,
			&i.Country,
			&i.Token,
			&i.TokenValid,
			&i.TokenExpiration,
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

const updateCustomer = `-- name: UpdateCustomer :one
UPDATE customers
SET
    username = COALESCE($3, username),
    passwordhash = COALESCE($4, passwordhash),
    firstname = COALESCE($5, firstname),
    lastname = COALESCE($6, lastname),
    birthday = COALESCE($7, birthday),
    email = COALESCE($8, email),
    phone = COALESCE($9, phone),
    city = COALESCE($10, city),
    zip = COALESCE($11, zip),
    street = COALESCE($12, street),
    country = COALESCE($13, country),
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING "ID", username, passwordhash, firstname, lastname, birthday, "privacyAccepted", "privacyAcceptedDate", email, phone, city, zip, street, country, token, "tokenValid", "tokenExpiration", creator, created, changer, changed
`

type UpdateCustomerParams struct {
	ID           int64          `json:"ID"`
	Changer      string         `json:"changer"`
	Username     sql.NullString `json:"username"`
	Passwordhash sql.NullString `json:"passwordhash"`
	Firstname    sql.NullString `json:"firstname"`
	Lastname     sql.NullString `json:"lastname"`
	Birthday     sql.NullTime   `json:"birthday"`
	Email        sql.NullString `json:"email"`
	Phone        sql.NullString `json:"phone"`
	City         sql.NullString `json:"city"`
	Zip          sql.NullString `json:"zip"`
	Street       sql.NullString `json:"street"`
	Country      sql.NullString `json:"country"`
}

func (q *Queries) UpdateCustomer(ctx context.Context, arg UpdateCustomerParams) (Customer, error) {
	row := q.db.QueryRowContext(ctx, updateCustomer,
		arg.ID,
		arg.Changer,
		arg.Username,
		arg.Passwordhash,
		arg.Firstname,
		arg.Lastname,
		arg.Birthday,
		arg.Email,
		arg.Phone,
		arg.City,
		arg.Zip,
		arg.Street,
		arg.Country,
	)
	var i Customer
	err := row.Scan(
		&i.ID,
		&i.Username,
		&i.Passwordhash,
		&i.Firstname,
		&i.Lastname,
		&i.Birthday,
		&i.PrivacyAccepted,
		&i.PrivacyAcceptedDate,
		&i.Email,
		&i.Phone,
		&i.City,
		&i.Zip,
		&i.Street,
		&i.Country,
		&i.Token,
		&i.TokenValid,
		&i.TokenExpiration,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}