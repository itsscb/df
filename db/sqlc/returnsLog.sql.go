// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0
// source: returnsLog.sql

package db

import (
	"context"
	"database/sql"
)

const createReturnsLog = `-- name: CreateReturnsLog :one
INSERT INTO "returnsLog" (
    "return_id",
    "mail_id",
    "status",
    "creator",
    "changer"
) VALUES (
    $1,
    $2,
    $3,
    $4,
    $4
) RETURNING id, return_id, mail_id, status, creator, created, changer, changed
`

type CreateReturnsLogParams struct {
	ReturnID int64          `json:"return_id"`
	MailID   int64          `json:"mail_id"`
	Status   sql.NullString `json:"status"`
	Creator  string         `json:"creator"`
}

func (q *Queries) CreateReturnsLog(ctx context.Context, arg CreateReturnsLogParams) (ReturnsLog, error) {
	row := q.db.QueryRowContext(ctx, createReturnsLog,
		arg.ReturnID,
		arg.MailID,
		arg.Status,
		arg.Creator,
	)
	var i ReturnsLog
	err := row.Scan(
		&i.ID,
		&i.ReturnID,
		&i.MailID,
		&i.Status,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const deleteReturnsLog = `-- name: DeleteReturnsLog :exec
DELETE FROM "returnsLog"
WHERE "id" = $1
`

func (q *Queries) DeleteReturnsLog(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteReturnsLog, id)
	return err
}

const getReturnsLog = `-- name: GetReturnsLog :one
SELECT id, return_id, mail_id, status, creator, created, changer, changed FROM "returnsLog"
WHERE "id" = $1 LIMIT 1
`

func (q *Queries) GetReturnsLog(ctx context.Context, id int64) (ReturnsLog, error) {
	row := q.db.QueryRowContext(ctx, getReturnsLog, id)
	var i ReturnsLog
	err := row.Scan(
		&i.ID,
		&i.ReturnID,
		&i.MailID,
		&i.Status,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}

const listReturnsLogs = `-- name: ListReturnsLogs :many
SELECT id, return_id, mail_id, status, creator, created, changer, changed FROM "returnsLog"
ORDER BY "status"
LIMIT $1
OFFSET $2
`

type ListReturnsLogsParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListReturnsLogs(ctx context.Context, arg ListReturnsLogsParams) ([]ReturnsLog, error) {
	rows, err := q.db.QueryContext(ctx, listReturnsLogs, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []ReturnsLog{}
	for rows.Next() {
		var i ReturnsLog
		if err := rows.Scan(
			&i.ID,
			&i.ReturnID,
			&i.MailID,
			&i.Status,
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

const updateReturnsLog = `-- name: UpdateReturnsLog :one
UPDATE "returnsLog"
SET
    "return_id" = COALESCE($2, "return_id"),
    "mail_id" = COALESCE($3, "mail_id"),
    "status" = COALESCE($4, "status"),
    "changer" = $1,
    "changed" = now()
WHERE "id" = $5
RETURNING id, return_id, mail_id, status, creator, created, changer, changed
`

type UpdateReturnsLogParams struct {
	Changer  string         `json:"changer"`
	ReturnID sql.NullInt64  `json:"return_id"`
	MailID   sql.NullInt64  `json:"mail_id"`
	Status   sql.NullString `json:"status"`
	ID       int64          `json:"id"`
}

func (q *Queries) UpdateReturnsLog(ctx context.Context, arg UpdateReturnsLogParams) (ReturnsLog, error) {
	row := q.db.QueryRowContext(ctx, updateReturnsLog,
		arg.Changer,
		arg.ReturnID,
		arg.MailID,
		arg.Status,
		arg.ID,
	)
	var i ReturnsLog
	err := row.Scan(
		&i.ID,
		&i.ReturnID,
		&i.MailID,
		&i.Status,
		&i.Creator,
		&i.Created,
		&i.Changer,
		&i.Changed,
	)
	return i, err
}
