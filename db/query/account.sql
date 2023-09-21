-- name: GetAccount :one
SELECT * FROM accounts
WHERE "ID" = $1 LIMIT 1;

-- name: CreateAccount :one
INSERT INTO accounts (
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
) RETURNING *;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY username
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :one
UPDATE accounts
SET
    username = COALESCE(sqlc.narg(username), username),
    passwordhash = COALESCE(sqlc.narg(passwordhash), passwordhash),
    firstname = COALESCE(sqlc.narg(firstname), firstname),
    lastname = COALESCE(sqlc.narg(lastname), lastname),
    birthday = COALESCE(sqlc.narg(birthday), birthday),
    email = COALESCE(sqlc.narg(email), email),
    phone = COALESCE(sqlc.narg(phone), phone),
    city = COALESCE(sqlc.narg(city), city),
    zip = COALESCE(sqlc.narg(zip), zip),
    street = COALESCE(sqlc.narg(street), street),
    country = COALESCE(sqlc.narg(country), country),
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE "ID" = $1;