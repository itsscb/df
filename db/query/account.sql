-- name: GetAccount :one
SELECT * FROM accounts
WHERE "id" = $1 LIMIT 1;

-- name: GetAccountForUpdate :one
SELECT * FROM accounts
WHERE "id" = $1 LIMIT 1
FOR NO KEY UPDATE;

-- name: CreateAccount :one
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
    sqlc.arg(passwordhash),
    sqlc.arg(privacy_accepted),
    sqlc.arg(privacy_accepted_date),
    sqlc.arg(firstname),
    sqlc.arg(lastname),
    sqlc.arg(birthday),
    sqlc.arg(email),
    sqlc.arg(phone),
    sqlc.arg(city),
    sqlc.arg(zip),
    sqlc.arg(street),
    sqlc.arg(country),
    sqlc.arg(creator),
    sqlc.arg(creator)
) RETURNING *;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY "lastname", "firstname"
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :one
UPDATE accounts
SET
    "passwordhash" = COALESCE(sqlc.narg(passwordhash), "passwordhash"),
    "privacy_accepted" = COALESCE(sqlc.narg(privacy_accepted), "privacy_accepted"),
    "privacy_accepted_date" = COALESCE(sqlc.narg(privacy_accepted_date), "privacy_accepted_date"),
    "firstname" = COALESCE(sqlc.narg(firstname), "firstname"),
    "lastname" = COALESCE(sqlc.narg(lastname), "lastname"),
    "birthday" = COALESCE(sqlc.narg(birthday), "birthday"),
    "email" = COALESCE(sqlc.narg(email), "email"),
    "phone" = COALESCE(sqlc.narg(phone), "phone"),
    "city" = COALESCE(sqlc.narg(city), "city"),
    "zip" = COALESCE(sqlc.narg(zip), "zip"),
    "street" = COALESCE(sqlc.narg(street), "street"),
    "country" = COALESCE(sqlc.narg(country), "country"),
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE "id" = $1;