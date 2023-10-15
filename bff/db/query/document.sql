-- name: GetDocument :one
SELECT * FROM documents
WHERE "id" = $1 LIMIT 1;

-- name: GetDocumentByHash :many
SELECT d."id" FROM documents d
INNER JOIN persons p
    ON d."person_id" = p."id"
WHERE p."account_id" = sqlc.arg(account_id) AND
    d."hash" = sqlc.arg(hash);

-- name: GetDocumentByIDWithAccountID :one
SELECT d.* FROM documents d
INNER JOIN persons p
    ON d."person_id" = p."id"
WHERE d."id" = sqlc.arg(id) AND p."account_id" = sqlc.arg(account_id);

-- name: CreateDocument :one
INSERT INTO documents (
    "person_id",
    "name",
    "type",
    "path",
    "hash",
    "creator",
    "changer",
    "mail_id"
) VALUES (
    sqlc.narg(person_id), 
    sqlc.arg(name), 
    sqlc.arg(type), 
    sqlc.arg(path), 
    sqlc.arg(hash), 
    sqlc.arg(creator), 
    sqlc.arg(creator),
    sqlc.narg(mail_id)
) RETURNING *;

-- name: CreateDocumentUpload :one
INSERT INTO documents (
    "person_id",
    "name",
    "type",
    "path",
    "hash",
    "creator",
    "changer",
    "mail_id"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, NULL
) RETURNING *;

-- name: CreateDocumentMail :one
INSERT INTO documents (
    "mail_id",
    "name",
    "type",
    "path",
    "hash",
    "creator",
    "changer",
    "person_id"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, NULL
) RETURNING *;

-- name: ListDocuments :many
SELECT * FROM documents
ORDER BY "valid", "type", "name"
LIMIT $1
OFFSET $2;

-- name: UpdateDocument :one
UPDATE documents
SET
    "name" = COALESCE(sqlc.narg(name), "name"),
    "type" = COALESCE(sqlc.narg(type), "type"),
    "path" = COALESCE(sqlc.narg(path), "path"),
    "hash" = COALESCE(sqlc.narg(hash), "hash"),
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

-- name: DeleteDocumentsByPersonID :exec
DELETE FROM "documents"
WHERE "person_id" = sqlc.arg(person_id);