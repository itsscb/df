-- name: GetPayment :one
SELECT * FROM payments
WHERE "id" = $1 LIMIT 1;

-- name: CreatePayment :one
INSERT INTO payments (
    "account_id",
    "payment_category",
    "bankname",
    "IBAN",
    "BIC",
    "paypal_account",
    "paypal_id",
    "payment_system",
    "type",
    "creator",
    "changer"
) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
) RETURNING *;

-- name: ListPayments :many
SELECT * FROM payments
WHERE "account_id" = sqlc.arg(account_id)
ORDER BY "payment_category";

-- name: UpdatePayment :one
UPDATE payments
SET
    "payment_category" = COALESCE(sqlc.narg(payment_category), "payment_category"),
    "bankname" = COALESCE(sqlc.narg(bankname), "bankname"),
    "IBAN" = COALESCE(sqlc.narg(IBAN), "IBAN"),
    "BIC" = COALESCE(sqlc.narg(BIC), "BIC"),
    "paypal_account" = COALESCE(sqlc.narg(paypal_account), "paypal_account"),
    "paypal_id" = COALESCE(sqlc.narg(paypal_id), "paypal_id"),
    "payment_system" = COALESCE(sqlc.narg(payment_system), "payment_system"),
    "type" = COALESCE(sqlc.narg(type), "type"),
    "changer" = sqlc.arg(changer),
    "changed" = now()
WHERE "id" = sqlc.arg(id)
RETURNING *;

-- name: DeletePayment :exec
DELETE FROM payments
WHERE "id" = $1;