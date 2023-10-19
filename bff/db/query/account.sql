-- name: GetAccount :one
SELECT * FROM accounts
WHERE "id" = sqlc.arg(id);

-- name: GetAccountByEmail :one
SELECT * FROM accounts
WHERE "email" = sqlc.arg(email);

-- name: CreateAccount :one
INSERT INTO accounts (
    "email",
    "passwordhash",
    "secret_key"
)
VALUES (    
    sqlc.arg(email),
    sqlc.arg(passwordhash),
    sqlc.arg(secret_key)
)
RETURNING *;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY "email"
LIMIT $1
OFFSET $2;

-- name: VerifyAccountEmail :exec
UPDATE accounts
SET
    "email_verified" = sqlc.arg(email_verified),
    "email_verified_time" = sqlc.arg(email_verified_time),
    "secret_key" = ''
WHERE "id" = sqlc.arg(id);

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE "id" = sqlc.arg(id);