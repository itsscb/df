// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: document.sql

package db

import (
	"context"
	"database/sql"
)

const createDocumentMail = `-- name: CreateDocumentMail :one
INSERT INTO documents (
    "mailID",
    name,
    type,
    path,
    url,
    creator,
    changer
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) RETURNING "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed
`

type CreateDocumentMailParams struct {
	MailID  sql.NullInt64 `json:"mailID"`
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
    "personID",
    name,
    type,
    path,
    url,
    creator,
    changer
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) RETURNING "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed
`

type CreateDocumentUploadParams struct {
	PersonID sql.NullInt64 `json:"personID"`
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
WHERE "ID" = $1
`

func (q *Queries) DeleteDocument(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteDocument, id)
	return err
}

const getDocument = `-- name: GetDocument :one
SELECT "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed FROM documents
WHERE "ID" = $1 LIMIT 1
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
    valid = false,
    "validDate" = NULL,
    "validatedBy" = NULL,    
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed
`

type InvalidateDocumentParams struct {
	ID      int64  `json:"ID"`
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
SELECT "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed FROM documents
ORDER BY valid, type, name
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
    "personID" = COALESCE($3, "personID"),
    name = COALESCE($4, name),
    type = COALESCE($5, type),
    path = COALESCE($6, path),
    url = COALESCE($7, url),
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed
`

type UpdateDocumentParams struct {
	ID       int64          `json:"ID"`
	Changer  string         `json:"changer"`
	Personid sql.NullInt64  `json:"personid"`
	Name     sql.NullString `json:"name"`
	Type     sql.NullString `json:"type"`
	Path     sql.NullString `json:"path"`
	Url      sql.NullString `json:"url"`
}

func (q *Queries) UpdateDocument(ctx context.Context, arg UpdateDocumentParams) (Document, error) {
	row := q.db.QueryRowContext(ctx, updateDocument,
		arg.ID,
		arg.Changer,
		arg.Personid,
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
    valid = true,
    "validDate" = now(),
    "validatedBy" = $2,    
    changer = $2,
    changed = now()
WHERE "ID" = $1
RETURNING "ID", "personID", name, type, path, url, valid, "validDate", "validatedBy", "mailID", creator, created, changer, changed
`

type ValidateDocumentParams struct {
	ID          int64          `json:"ID"`
	ValidatedBy sql.NullString `json:"validatedBy"`
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