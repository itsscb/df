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
    "person_id" = COALESCE(sqlc.narg(person_id), "person_id"),
    "provider_id" = COALESCE(sqlc.narg(provider_id), "provider_id"),
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