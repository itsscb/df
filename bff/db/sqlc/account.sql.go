// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.22.0
// source: account.sql

package db

import (
	"context"
	"database/sql"
)

const createAccount = `-- name: CreateAccount :one
INSERT INTO accounts (
    "email",
    "passwordhash",
    "secret_key",
    "verification_sent"
)
VALUES (    
    $1,
    $2,
    $3,
    now()
)
RETURNING id, permission_level, passwordhash, email, secret_key, verification_sent, email_verified, email_verified_time
`

type CreateAccountParams struct {
	Email        string         `json:"email"`
	Passwordhash string         `json:"passwordhash"`
	SecretKey    sql.NullString `json:"secret_key"`
}

func (q *Queries) CreateAccount(ctx context.Context, arg CreateAccountParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, createAccount, arg.Email, arg.Passwordhash, arg.SecretKey)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
		&i.Passwordhash,
		&i.Email,
		&i.SecretKey,
		&i.VerificationSent,
		&i.EmailVerified,
		&i.EmailVerifiedTime,
	)
	return i, err
}

const deleteAccount = `-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE "id" = $1
`

func (q *Queries) DeleteAccount(ctx context.Context, id uint64) error {
	_, err := q.db.ExecContext(ctx, deleteAccount, id)
	return err
}

const getAccount = `-- name: GetAccount :one
SELECT id, permission_level, passwordhash, email, secret_key, verification_sent, email_verified, email_verified_time FROM accounts
WHERE "id" = $1
`

func (q *Queries) GetAccount(ctx context.Context, id uint64) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccount, id)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
		&i.Passwordhash,
		&i.Email,
		&i.SecretKey,
		&i.VerificationSent,
		&i.EmailVerified,
		&i.EmailVerifiedTime,
	)
	return i, err
}

const getAccountByEmail = `-- name: GetAccountByEmail :one
SELECT id, permission_level, passwordhash, email, secret_key, verification_sent, email_verified, email_verified_time FROM accounts
WHERE "email" = $1
`

func (q *Queries) GetAccountByEmail(ctx context.Context, email string) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccountByEmail, email)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
		&i.Passwordhash,
		&i.Email,
		&i.SecretKey,
		&i.VerificationSent,
		&i.EmailVerified,
		&i.EmailVerifiedTime,
	)
	return i, err
}

const getAccountLevel = `-- name: GetAccountLevel :one
SELECT
    accounts.id,
    CASE
        WHEN payments.account_id IS NOT NULL THEN 7
        WHEN persons.relationship IS NOT NULL AND persons.relationship <> '' AND persons.relationship = 'sole_heir' THEN 
            CASE
                WHEN (
                    SELECT COUNT(*)
                    FROM documents
                    WHERE person_id = persons.id AND name IN ('death_certificate','id_card','notary_inheritance_certificate')
                ) = 3 THEN 6
            END
        WHEN persons.relationship IS NOT NULL AND persons.relationship <> '' AND persons.relationship <> 'sole_heir' THEN 
            CASE
                WHEN (
                    SELECT COUNT(*)
                    FROM documents
                    WHERE person_id = persons.id AND name IN ('death_certificate','id_card')
                ) = 2 THEN 6
            END
        WHEN (
            SELECT COUNT(*)
            FROM email_addresses
            WHERE person_id = persons.id
        ) > 0 THEN 5
        WHEN persons.relationship IS NOT NULL AND persons.relationship <> '' THEN 4
        WHEN persons.account_id IS NOT NULL THEN 3
        WHEN account_info.account_id IS NOT NULL THEN 2
        WHEN accounts.verified = true THEN 1
        ELSE 0
    END AS account_level
FROM
    accounts
LEFT JOIN account_info ON accounts.id = account_info.account_id
LEFT JOIN persons ON accounts.id = persons.account_id
LEFT JOIN email_addresses ON persons.id = email_addresses.person_id
LEFT JOIN phone_numbers ON persons.id = phone_numbers.person_id
LEFT JOIN documents ON persons.id = documents.person_id
LEFT JOIN payments ON accounts.id = payments.account_id
WHERE accounts.id = $1
`

type GetAccountLevelRow struct {
	ID           uint64 `json:"id"`
	AccountLevel int32  `json:"account_level"`
}

func (q *Queries) GetAccountLevel(ctx context.Context, accountID uint64) (GetAccountLevelRow, error) {
	row := q.db.QueryRowContext(ctx, getAccountLevel, accountID)
	var i GetAccountLevelRow
	err := row.Scan(&i.ID, &i.AccountLevel)
	return i, err
}

const listAccounts = `-- name: ListAccounts :many
SELECT id, permission_level, passwordhash, email, secret_key, verification_sent, email_verified, email_verified_time FROM accounts
ORDER BY "email"
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
			&i.Email,
			&i.SecretKey,
			&i.VerificationSent,
			&i.EmailVerified,
			&i.EmailVerifiedTime,
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

const resendVerification = `-- name: ResendVerification :one
UPDATE accounts
SET
    "secret_key" = $1,
    "verification_sent" = now()
WHERE "id" = $2
RETURNING id, permission_level, passwordhash, email, secret_key, verification_sent, email_verified, email_verified_time
`

type ResendVerificationParams struct {
	SecretKey sql.NullString `json:"secret_key"`
	ID        uint64         `json:"id"`
}

func (q *Queries) ResendVerification(ctx context.Context, arg ResendVerificationParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, resendVerification, arg.SecretKey, arg.ID)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
		&i.Passwordhash,
		&i.Email,
		&i.SecretKey,
		&i.VerificationSent,
		&i.EmailVerified,
		&i.EmailVerifiedTime,
	)
	return i, err
}

const updateAccount = `-- name: UpdateAccount :one
UPDATE accounts 
SET
    "email" = COALESCE($1, "email"),
    "passwordhash" = COALESCE($2, "passwordhash"),
    "secret_key" = COALESCE($3, "secret_key")
WHERE "id" = $4
RETURNING id, permission_level, passwordhash, email, secret_key, verification_sent, email_verified, email_verified_time
`

type UpdateAccountParams struct {
	Email        sql.NullString `json:"email"`
	Passwordhash sql.NullString `json:"passwordhash"`
	SecretKey    sql.NullString `json:"secret_key"`
	ID           uint64         `json:"id"`
}

func (q *Queries) UpdateAccount(ctx context.Context, arg UpdateAccountParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, updateAccount,
		arg.Email,
		arg.Passwordhash,
		arg.SecretKey,
		arg.ID,
	)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.PermissionLevel,
		&i.Passwordhash,
		&i.Email,
		&i.SecretKey,
		&i.VerificationSent,
		&i.EmailVerified,
		&i.EmailVerifiedTime,
	)
	return i, err
}

const verifyAccountEmail = `-- name: VerifyAccountEmail :exec
UPDATE accounts
SET
    "email_verified" = $1,
    "email_verified_time" = $2,
    "secret_key" = ''
WHERE "id" = $3
`

type VerifyAccountEmailParams struct {
	EmailVerified     sql.NullBool `json:"email_verified"`
	EmailVerifiedTime sql.NullTime `json:"email_verified_time"`
	ID                uint64       `json:"id"`
}

func (q *Queries) VerifyAccountEmail(ctx context.Context, arg VerifyAccountEmailParams) error {
	_, err := q.db.ExecContext(ctx, verifyAccountEmail, arg.EmailVerified, arg.EmailVerifiedTime, arg.ID)
	return err
}
