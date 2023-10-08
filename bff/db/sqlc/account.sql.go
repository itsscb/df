// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.22.0
// source: account.sql

package db

import (
	"context"
	"database/sql"
	"time"
)

const createAccount = `-- name: CreateAccount :one
INSERT INTO accounts (
    "passwordhash",
    "privacy_accepted",
    "privacy_accepted_date",
    "firstname",
    "lastname",
    "birthday",
    "email",
    "phone",
    "city",
    "zip",
    "street",
    "country",
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
    $9,
    $10,
    $11,
    $12,
    $13,
    $13
) RETURNING id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed
`

type CreateAccountParams struct {
	Passwordhash        string         `json:"passwordhash"`
	PrivacyAccepted     sql.NullBool   `json:"privacy_accepted"`
	PrivacyAcceptedDate sql.NullTime   `json:"privacy_accepted_date"`
	Firstname           string         `json:"firstname"`
	Lastname            string         `json:"lastname"`
	Birthday            time.Time      `json:"birthday"`
	Email               string         `json:"email"`
	Phone               sql.NullString `json:"phone"`
	City                string         `json:"city"`
	Zip                 string         `json:"zip"`
	Street              string         `json:"street"`
	Country             string         `json:"country"`
	Creator             string         `json:"creator"`
}

func (q *Queries) CreateAccount(ctx context.Context, arg CreateAccountParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, createAccount,
		arg.Passwordhash,
		arg.PrivacyAccepted,
		arg.PrivacyAcceptedDate,
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
	)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
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
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deleteAccount = `-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE "id" = $1
`

func (q *Queries) DeleteAccount(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteAccount, id)
	return err
}

const getAccount = `-- name: GetAccount :one
SELECT id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed FROM accounts
WHERE "id" = $1 LIMIT 1
`

func (q *Queries) GetAccount(ctx context.Context, id int64) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccount, id)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
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
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const getAccountByEmail = `-- name: GetAccountByEmail :one
SELECT id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed FROM accounts
WHERE "email" = $1 LIMIT 1
`

func (q *Queries) GetAccountByEmail(ctx context.Context, email string) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccountByEmail, email)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
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
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const getAccountForUpdate = `-- name: GetAccountForUpdate :one
SELECT id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed FROM accounts
WHERE "id" = $1 LIMIT 1
FOR NO KEY UPDATE
`

func (q *Queries) GetAccountForUpdate(ctx context.Context, id int64) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccountForUpdate, id)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
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
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const listAccounts = `-- name: ListAccounts :many
SELECT id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed FROM accounts
ORDER BY "lastname", "firstname"
LIMIT $1
OFFSET $2
`

type ListAccountsParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListAccounts(ctx context.Context, arg ListAccountsParams) ([]Account, error) {
	rows, err := q.db.QueryContext(ctx, listAccounts, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Account{}
	for rows.Next() {
		var i Account
		if err := rows.Scan(
			&i.ID,
			&i.PermissionLevel,
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

const updateAccount = `-- name: UpdateAccount :one
UPDATE accounts
SET
    "passwordhash" = COALESCE($3, "passwordhash"),
    "firstname" = COALESCE($4, "firstname"),
    "lastname" = COALESCE($5, "lastname"),
    "birthday" = COALESCE($6, "birthday"),
    "email" = COALESCE($7, "email"),
    "phone" = COALESCE($8, "phone"),
    "city" = COALESCE($9, "city"),
    "zip" = COALESCE($10, "zip"),
    "street" = COALESCE($11, "street"),
    "country" = COALESCE($12, "country"),
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed
`

type UpdateAccountParams struct {
	ID           int64          `json:"id"`
	Changer      string         `json:"changer"`
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

func (q *Queries) UpdateAccount(ctx context.Context, arg UpdateAccountParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, updateAccount,
		arg.ID,
		arg.Changer,
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
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
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
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const updateAccountPrivacy = `-- name: UpdateAccountPrivacy :one
UPDATE accounts
SET
    "privacy_accepted" = $1,
    "privacy_accepted_date" = $2,
    "changer" = $3,
    "changed" = now()
WHERE "id" = $4
RETURNING id, permission_level, passwordhash, firstname, lastname, birthday, privacy_accepted, privacy_accepted_date, email, phone, city, zip, street, country, creator, created, changer, changed
`

type UpdateAccountPrivacyParams struct {
	PrivacyAccepted     sql.NullBool `json:"privacy_accepted"`
	PrivacyAcceptedDate sql.NullTime `json:"privacy_accepted_date"`
	Changer             string       `json:"changer"`
	ID                  int64        `json:"id"`
}

func (q *Queries) UpdateAccountPrivacy(ctx context.Context, arg UpdateAccountPrivacyParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, updateAccountPrivacy,
		arg.PrivacyAccepted,
		arg.PrivacyAcceptedDate,
		arg.Changer,
		arg.ID,
	)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
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
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}
