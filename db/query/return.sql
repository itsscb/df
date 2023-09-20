-- name: GetReturn :one
SELECT * FROM returns
WHERE "ID" = sqlc.arg(ID) LIMIT 1;

-- name: CreateReturn :one
INSERT INTO returns (
    "personID",
    "providerID",
    "name",
    "description",
    "category",
    "email",
    "status",
    "creator",
    "changer"
) VALUES (
    sqlc.arg(personID),
    sqlc.arg(providerID),
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
ORDER BY name
LIMIT $1
OFFSET $2;

-- name: UpdateReturn :one
UPDATE returns
SET
    "personID" = COALESCE(sqlc.narg(personID), "personID"),
    "providerID" = COALESCE(sqlc.narg(providerID), "providerID"),
    "name" = COALESCE(sqlc.narg(name), "name"),
    "description" = COALESCE(sqlc.narg(description), "description"),
    "category" = COALESCE(sqlc.narg(category), "category"),
    "email" = COALESCE(sqlc.narg(email), "email"),
    "status" = COALESCE(sqlc.narg(status), "status"),
    changer = sqlc.arg(changer),
    changed = now()
WHERE "ID" = sqlc.arg(ID)
RETURNING *;

-- name: DeleteReturn :exec
DELETE FROM returns
WHERE "ID" = sqlc.arg(ID);