-- name: GetPayment :one
SELECT * FROM payments
WHERE "ID" = $1 LIMIT 1;

-- name: CreatePayment :one
INSERT INTO payments (
    "accountID",
    "paymentCategory",
    "bankname",
    "IBAN",
    "BIC",
    "paypalAccount",
    "paypalID",
    "paymentSystem",
    "type",
    "creator",
    "changer"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
) RETURNING *;

-- name: ListPayments :many
SELECT * FROM payments
ORDER BY "paymentCategory"
LIMIT $1
OFFSET $2;

-- name: UpdatePayment :one
UPDATE payments
SET
    "accountID" = COALESCE(sqlc.narg(accountID), "accountID"),
    "paymentCategory" = COALESCE(sqlc.narg(paymentCategory), "paymentCategory"),
    "bankname" = COALESCE(sqlc.narg(bankname), "bankname"),
    "IBAN" = COALESCE(sqlc.narg(IBAN), "IBAN"),
    "BIC" = COALESCE(sqlc.narg(BIC), "BIC"),
    "paypalAccount" = COALESCE(sqlc.narg(paypalAccount), "paypalAccount"),
    "paypalID" = COALESCE(sqlc.narg(paypalID), "paypalID"),
    "paymentSystem" = COALESCE(sqlc.narg(paymentSystem), "paymentSystem"),
    "type" = COALESCE(sqlc.narg(type), "type"),
    "changer" = $2,
    "changed" = now()
WHERE "ID" = $1
RETURNING *;

-- name: DeletePayment :exec
DELETE FROM payments
WHERE "ID" = $1;