-- name: GetProvider :one
SELECT * FROM providers
WHERE "ID" = $1 LIMIT 1;

-- name: CreateProvider :one
INSERT INTO providers (
    name,
    description,
    category,
    email,
    creator,
    changer
) VALUES (
    $1, $2, $3, $4, $5, $6
) RETURNING *;

-- name: ListProviders :many
SELECT * FROM providers
ORDER BY name
LIMIT $1
OFFSET $2;

-- name: UpdateProvider :one
UPDATE providers
SET
    name = COALESCE(sqlc.narg(name), name),
    description = COALESCE(sqlc.narg(description), description),
    category = COALESCE(sqlc.narg(category), category),
    email = COALESCE(sqlc.narg(email), email),
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING *;

-- name: DeleteProvider :exec
DELETE FROM providers
WHERE "ID" = $1;