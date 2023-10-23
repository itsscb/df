-- name: GetAccountInfo :one
SELECT * FROM account_info
WHERE "account_id" = $1 LIMIT 1;

-- name: CreateAccountInfo :one
INSERT INTO account_info (
    "account_id",
    "privacy_accepted",
    "privacy_accepted_date",
    "firstname",
    "lastname",
    "birthday",
    "phone",
    "city",
    "zip",
    "street",
    "country",
    "creator",
    "changer"
) VALUES (
    sqlc.arg(account_id),
    sqlc.arg(privacy_accepted),
    sqlc.arg(privacy_accepted_date),
    sqlc.arg(firstname),
    sqlc.arg(lastname),
    sqlc.arg(birthday),
    sqlc.arg(phone),
    sqlc.arg(city),
    sqlc.arg(zip),
    sqlc.arg(street),
    sqlc.arg(country),
    sqlc.arg(creator),
    sqlc.arg(creator)
) RETURNING *;

-- name: ListAccountInfo :many
SELECT * FROM account_info
ORDER BY "lastname", "firstname"
LIMIT $1
OFFSET $2;

-- name: UpdateAccountInfo :one
UPDATE account_info
SET
    "firstname" = COALESCE(sqlc.narg(firstname), "firstname"),
    "lastname" = COALESCE(sqlc.narg(lastname), "lastname"),
    "birthday" = COALESCE(sqlc.narg(birthday), "birthday"),
    "phone" = COALESCE(sqlc.narg(phone), "phone"),
    "city" = COALESCE(sqlc.narg(city), "city"),
    "zip" = COALESCE(sqlc.narg(zip), "zip"),
    "street" = COALESCE(sqlc.narg(street), "street"),
    "country" = COALESCE(sqlc.narg(country), "country"),
    "changer" = $2,
    "changed" = now()
WHERE "account_id" = $1
RETURNING *;

-- name: UpdateAccountPrivacy :one
UPDATE account_info
SET
    "privacy_accepted" = sqlc.arg(privacy_accepted),
    "privacy_accepted_date" = sqlc.arg(privacy_accepted_date),
    "changer" = sqlc.arg(changer),
    "changed" = now()
WHERE "account_id" = sqlc.arg(id)
RETURNING *;

-- name: DeleteAccountInfo :exec
DELETE FROM account_info
WHERE "account_id" = $1;