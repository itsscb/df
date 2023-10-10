-- name: GetReturn :one
SELECT * FROM returns
WHERE "id" = sqlc.arg(id) LIMIT 1;

-- name: CreateReturn :one
INSERT INTO returns (
    "person_id",
    "provider_id",
    "name",
    "description",
    "category",
    "email",
    "status",
    "creator",
    "changer"
) VALUES (
    sqlc.arg(person_id),
    sqlc.arg(provider_id),
    sqlc.arg(name),
    sqlc.arg(description),
    sqlc.arg(category),
    sqlc.arg(email),
    sqlc.arg(status),
    sqlc.arg(creator),
    sqlc.arg(changer)
) RETURNING *;

-- name: ListReturns :many
SELECT * FROM returns
ORDER BY "name"
LIMIT $1
OFFSET $2;

-- name: UpdateReturn :one
UPDATE returns
SET
    "name" = COALESCE(sqlc.narg(name), "name"),
    "description" = COALESCE(sqlc.narg(description), "description"),
    "category" = COALESCE(sqlc.narg(category), "category"),
    "email" = COALESCE(sqlc.narg(email), "email"),
    "status" = COALESCE(sqlc.narg(status), "status"),
    "changer" = sqlc.arg(changer),
    "changed" = now()
WHERE "id" = sqlc.arg(id)
RETURNING *;

-- name: DeleteReturn :exec
DELETE FROM returns
WHERE "id" = sqlc.arg(id);

-- name: CloneProviders :exec
INSERT INTO returns (
    "provider_id",
    "name",
    "description",
    "category",
    "email",
    "status",
    "creator",
    "changer",
    "person_id"
)
SELECT 
    "id",
    "name",
    "description",
    "category",
    "email",
    'new',
    sqlc.arg(creator),
    sqlc.arg(creator),
    sqlc.arg(person_id)
FROM providers;

-- name: GetReturnIDsByPersonID :many
SELECT "id" FROM "returns"
WHERE "person_id" = sqlc.arg(person_id);

-- name: DeleteReturnsByPersonID :exec
DELETE FROM "returns"
WHERE "person_id" = sqlc.arg(person_id);