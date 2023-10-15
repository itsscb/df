-- name: CreateSession :one
INSERT INTO sessions (
  id,
  account_id,
  refresh_token,
  user_agent,
  client_ip,
  is_blocked,
  expires_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
) RETURNING *;

-- name: GetSession :one
SELECT * FROM sessions
WHERE id = $1 LIMIT 1;

-- name: BlockSession :exec
UPDATE sessions
SET
    "is_blocked" = true
WHERE "id" = sqlc.arg(id);


-- name: ListSessions :many
SELECT * FROM sessions
WHERE account_id = sqlc.arg(account_id) AND is_blocked = false AND expires_at > now();