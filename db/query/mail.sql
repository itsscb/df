-- name: GetMail :one
SELECT * FROM mails
WHERE "ID" = $1 LIMIT 1;

-- name: CreateMail :one
INSERT INTO mails (
    "from",
    "to",
    cc,
    "subject",
    body,
    "timestamp",
    creator,
    changer
) 
VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8
) 
RETURNING *;

-- name: ListMails :many
SELECT * FROM mails
ORDER BY "timestamp", "from"
LIMIT $1
OFFSET $2;

-- -- name: UpdateMail :one
-- UPDATE mails
-- SET
--     "from" = COALESCE(sqlc.narg(from), "from"),
--     "to" = COALESCE(sqlc.narg(to), "to"),
--     cc = COALESCE(sqlc.narg(cc), cc),
--     "subject" = COALESCE(sqlc.narg(subject), "subject"),
--     body = COALESCE(sqlc.narg(body), body),
--     "timestamp" = COALESCE(sqlc.narg(timestamp), "timestamp"),
--     changer = $2,
--     changed = now()
-- WHERE "ID" = $1
-- RETURNING *;

-- name: DeleteMail :exec
DELETE FROM mails
WHERE "ID" = $1;