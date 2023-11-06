-- name: GetQueryByName :one
SELECT * FROM queries
WHERE "name" = sqlc.arg(name);