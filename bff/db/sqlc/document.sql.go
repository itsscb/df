// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.22.0
// source: document.sql

package db

import (
	"context"
	"database/sql"
)

const createDocumentMail = `-- name: CreateDocumentMail :one
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
) RETURNING id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed
`

type CreateDocumentMailParams struct {
	MailID  sql.NullInt64 `json:"mail_id"`
	Name    string        `json:"name"`
	Type    string        `json:"type"`
	Path    string        `json:"path"`
	Url     string        `json:"url"`
	Creator string        `json:"creator"`
	Changer string        `json:"changer"`
}

func (q *Queries) CreateDocumentMail(ctx context.Context, arg CreateDocumentMailParams) (Document, error) {
	row := q.db.QueryRowContext(ctx, createDocumentMail,
		arg.MailID,
		arg.Name,
		arg.Type,
		arg.Path,
		arg.Url,
		arg.Creator,
		arg.Changer,
	)
	var i Document
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.Name,
		&i.Type,
		&i.Path,
		&i.Url,
		&i.Valid,
		&i.ValidDate,
		&i.ValidatedBy,
		&i.MailID,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const createDocumentUpload = `-- name: CreateDocumentUpload :one
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
) RETURNING id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed
`

type CreateDocumentUploadParams struct {
	PersonID sql.NullInt64 `json:"person_id"`
	Name     string        `json:"name"`
	Type     string        `json:"type"`
	Path     string        `json:"path"`
	Url      string        `json:"url"`
	Creator  string        `json:"creator"`
	Changer  string        `json:"changer"`
}

func (q *Queries) CreateDocumentUpload(ctx context.Context, arg CreateDocumentUploadParams) (Document, error) {
	row := q.db.QueryRowContext(ctx, createDocumentUpload,
		arg.PersonID,
		arg.Name,
		arg.Type,
		arg.Path,
		arg.Url,
		arg.Creator,
		arg.Changer,
	)
	var i Document
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.Name,
		&i.Type,
		&i.Path,
		&i.Url,
		&i.Valid,
		&i.ValidDate,
		&i.ValidatedBy,
		&i.MailID,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deleteDocument = `-- name: DeleteDocument :exec
DELETE FROM documents
WHERE "id" = $1
`

func (q *Queries) DeleteDocument(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteDocument, id)
	return err
}

const getDocument = `-- name: GetDocument :one
SELECT id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed FROM documents
WHERE "id" = $1 LIMIT 1
`

func (q *Queries) GetDocument(ctx context.Context, id int64) (Document, error) {
	row := q.db.QueryRowContext(ctx, getDocument, id)
	var i Document
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.Name,
		&i.Type,
		&i.Path,
		&i.Url,
		&i.Valid,
		&i.ValidDate,
		&i.ValidatedBy,
		&i.MailID,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const invalidateDocument = `-- name: InvalidateDocument :one
UPDATE documents
SET
    "valid" = false,
    "valid_date" = NULL,
    "validated_by" = NULL,    
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed
`

type InvalidateDocumentParams struct {
	ID      int64  `json:"id"`
	Changer string `json:"changer"`
}

func (q *Queries) InvalidateDocument(ctx context.Context, arg InvalidateDocumentParams) (Document, error) {
	row := q.db.QueryRowContext(ctx, invalidateDocument, arg.ID, arg.Changer)
	var i Document
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.Name,
		&i.Type,
		&i.Path,
		&i.Url,
		&i.Valid,
		&i.ValidDate,
		&i.ValidatedBy,
		&i.MailID,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const listDocuments = `-- name: ListDocuments :many
SELECT id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed FROM documents
ORDER BY "valid", "type", "name"
LIMIT $1
OFFSET $2
`

type ListDocumentsParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListDocuments(ctx context.Context, arg ListDocumentsParams) ([]Document, error) {
	rows, err := q.db.QueryContext(ctx, listDocuments, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Document{}
	for rows.Next() {
		var i Document
		if err := rows.Scan(
			&i.ID,
			&i.PersonID,
			&i.Name,
			&i.Type,
			&i.Path,
			&i.Url,
			&i.Valid,
			&i.ValidDate,
			&i.ValidatedBy,
			&i.MailID,
			&i.Creator,
			&i.Created,
			&i.Changer,
			&i.Changed,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const updateDocument = `-- name: UpdateDocument :one
UPDATE documents
SET
    "person_id" = COALESCE($3, "person_id"),
    "name" = COALESCE($4, "name"),
    "type" = COALESCE($5, "type"),
    "path" = COALESCE($6, "path"),
    "url" = COALESCE($7, "url"),
    changer = $2,
    changed = now()
WHERE "id" = $1
RETURNING id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed
`

type UpdateDocumentParams struct {
	ID       int64          `json:"id"`
	Changer  string         `json:"changer"`
	PersonID sql.NullInt64  `json:"person_id"`
	Name     sql.NullString `json:"name"`
	Type     sql.NullString `json:"type"`
	Path     sql.NullString `json:"path"`
	Url      sql.NullString `json:"url"`
}

func (q *Queries) UpdateDocument(ctx context.Context, arg UpdateDocumentParams) (Document, error) {
	row := q.db.QueryRowContext(ctx, updateDocument,
		arg.ID,
		arg.Changer,
		arg.PersonID,
		arg.Name,
		arg.Type,
		arg.Path,
		arg.Url,
	)
	var i Document
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.Name,
		&i.Type,
		&i.Path,
		&i.Url,
		&i.Valid,
		&i.ValidDate,
		&i.ValidatedBy,
		&i.MailID,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const validateDocument = `-- name: ValidateDocument :one
UPDATE documents
SET
    "valid" = true,
    "valid_date" = now(),
    "validated_by" = $2,    
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING id, person_id, name, type, path, url, valid, valid_date, validated_by, mail_id, creator, created, changer, changed
`

type ValidateDocumentParams struct {
	ID          int64          `json:"id"`
	ValidatedBy sql.NullString `json:"validated_by"`
}

func (q *Queries) ValidateDocument(ctx context.Context, arg ValidateDocumentParams) (Document, error) {
	row := q.db.QueryRowContext(ctx, validateDocument, arg.ID, arg.ValidatedBy)
	var i Document
	err := row.Scan(
		&i.ID,
		&i.PersonID,
		&i.Name,
		&i.Type,
		&i.Path,
		&i.Url,
		&i.Valid,
		&i.ValidDate,
		&i.ValidatedBy,
		&i.MailID,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}
