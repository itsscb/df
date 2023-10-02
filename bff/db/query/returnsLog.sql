-- name: GetReturnsLog :one
SELECT * FROM "returnsLog"
WHERE "id" = sqlc.arg(id) LIMIT 1;

-- name: CreateReturnsLog :one
INSERT INTO "returnsLog" (
    "return_id",
    "mail_id",
    "status",
    "creator",
    "changer"
) VALUES (
    sqlc.arg(return_id),
    sqlc.arg(mail_id),
    sqlc.arg(status),
    sqlc.arg(creator),
    sqlc.arg(creator)
) RETURNING *;

-- name: ListReturnsLogs :many
SELECT * FROM "returnsLog"
ORDER BY "status"
LIMIT $1
OFFSET $2;

-- name: UpdateReturnsLog :one
UPDATE "returnsLog"
SET
    "return_id" = COALESCE(sqlc.narg(return_id), "return_id"),
    "mail_id" = COALESCE(sqlc.narg(mail_id), "mail_id"),
    "status" = COALESCE(sqlc.narg(status), "status"),
    "changer" = $1,
    "changed" = now()
WHERE "id" = sqlc.arg(id)
RETURNING *;

-- name: DeleteReturnsLog :exec
DELETE FROM "returnsLog"
WHERE "id" = sqlc.arg(id);