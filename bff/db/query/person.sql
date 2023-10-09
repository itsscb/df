-- name: GetPerson :one
SELECT * FROM persons
WHERE "id" = $1 LIMIT 1;

-- name: CreatePerson :one
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
) RETURNING *;

-- name: ListPersons :many
SELECT * FROM persons
WHERE "account_id" = sqlc.arg(account_id)
ORDER BY "lastname", "firstname";

-- name: UpdatePerson :one
UPDATE persons
SET
    "firstname" = COALESCE(sqlc.narg(firstname), "firstname"),
    "lastname" = COALESCE(sqlc.narg(lastname), "lastname"),
    "birthday" = COALESCE(sqlc.narg(birthday), "birthday"),
    "city" = COALESCE(sqlc.narg(city), "city"),
    "zip" = COALESCE(sqlc.narg(zip), "zip"),
    "street" = COALESCE(sqlc.narg(street), "street"),
    "country" = COALESCE(sqlc.narg(country), "country"),
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING *;

-- name: DeletePerson :exec
DELETE FROM persons
WHERE "id" = sqlc.arg(id);

-- name: GetReturns :many
SELECT * FROM returns
WHERE "person_id" = sqlc.arg(id);