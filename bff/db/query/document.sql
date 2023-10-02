-- name: GetDocument :one
SELECT * FROM documents
WHERE "id" = $1 LIMIT 1;

-- name: CreateDocumentUpload :one
INSERT INTO documents (
    "person_id",
    "name",
    "type",
    "path",
    "url",
    "creator",
    "changer"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) RETURNING *;

-- name: CreateDocumentMail :one
INSERT INTO documents (
    "mail_id",
    "name",
    "type",
    "path",
    "url",
    "creator",
    "changer"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) RETURNING *;

-- name: ListDocuments :many
SELECT * FROM documents
ORDER BY "valid", "type", "name"
LIMIT $1
OFFSET $2;

-- name: UpdateDocument :one
UPDATE documents
SET
    "person_id" = COALESCE(sqlc.narg(person_id), "person_id"),
    "name" = COALESCE(sqlc.narg(name), "name"),
    "type" = COALESCE(sqlc.narg(type), "type"),
    "path" = COALESCE(sqlc.narg(path), "path"),
    "url" = COALESCE(sqlc.narg(url), "url"),
    changer = $2,
    changed = now()
WHERE "id" = $1
RETURNING *;

-- name: ValidateDocument :one
UPDATE documents
SET
    "valid" = true,
    "valid_date" = now(),
    "validated_by" = $2,    
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING *;

-- name: InvalidateDocument :one
UPDATE documents
SET
    "valid" = false,
    "valid_date" = NULL,
    "validated_by" = NULL,    
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING *;

-- name: DeleteDocument :exec
DELETE FROM documents
WHERE "id" = $1;