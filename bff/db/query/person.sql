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
    "relationship",
    "country",
    "creator",
    "changer"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
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
    "relationship" = COALESCE(sqlc.narg(relationship), "relationship"),
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


-- name: GetPhoneNumbers :many
SELECT * FROM phone_numbers
WHERE "person_id" = sqlc.arg(person_id);

-- name: AddPhoneNumber :one
INSERT INTO phone_numbers (
    "person_id",
    "phone"
) VALUES (
    sqlc.arg(person_id), sqlc.arg(email)
) RETURNING *;

-- name: DeletePhoneNumber :exec
DELETE FROM phone_numbers
WHERE "id" = sqlc.arg(id);

-- name: DeleteAllPhoneNumbers :exec
DELETE FROM phone_numbers
WHERE "person_id" = sqlc.arg(person_id);

-- name: GetEmailAddresses :many
SELECT * FROM email_addresses
WHERE "person_id" = sqlc.arg(person_id);

-- name: AddEmailAddress :one
INSERT INTO email_addresses (
    "person_id",
    "email"
) VALUES (
    sqlc.arg(person_id), sqlc.arg(email)
) RETURNING *;

-- name: DeleteEmailAddress :exec
DELETE FROM email_addresses
WHERE "id" = sqlc.arg(id);

-- name: DeleteAllEmailAddresses :exec
DELETE FROM email_addresses
WHERE "person_id" = sqlc.arg(person_id);