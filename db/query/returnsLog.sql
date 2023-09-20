-- name: GetReturnsLog :one
SELECT * FROM "returnsLog"
WHERE "ID" = sqlc.arg(ID) LIMIT 1;

-- name: CreateReturnsLog :one
INSERT INTO "returnsLog" (
    "returnID",
    "mailID",
    "status",
    "creator",
    "changer"
) VALUES (
    sqlc.arg(returnID),
    sqlc.arg(mailID),
    sqlc.arg(status),
    sqlc.arg(creator),
    sqlc.arg(creator)
) RETURNING *;

-- name: ListReturnsLogs :many
SELECT * FROM "returnsLog"
ORDER BY status
LIMIT $1
OFFSET $2;

-- name: UpdateReturnsLog :one
UPDATE "returnsLog"
SET
    "returnID" = COALESCE(sqlc.narg(returnID), "returnID"),
    "mailID" = COALESCE(sqlc.narg(mailID), "mailID"),
    "status" = COALESCE(sqlc.narg(status), "status"),
    changer = $1,
    changed = now()
WHERE "ID" = sqlc.arg(ID)
RETURNING *;

-- name: DeleteReturnsLog :exec
DELETE FROM "returnsLog"
WHERE "ID" = sqlc.arg(ID);