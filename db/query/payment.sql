-- name: GetPayment :one
SELECT * FROM payments
WHERE "id" = $1 LIMIT 1;

-- name: CreatePayment :one
INSERT INTO payments (
    "account_id",
    "payment_category",
    "bankname",
    "iban",
    "bic",
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
ORDER BY "payment_category"
LIMIT $1
OFFSET $2;

-- name: UpdatePayment :one
UPDATE payments
SET
    "account_id" = COALESCE(sqlc.narg(account_id), "account_id"),
    "payment_category" = COALESCE(sqlc.narg(payment_category), "payment_category"),
    "bankname" = COALESCE(sqlc.narg(bankname), "bankname"),
    "iban" = COALESCE(sqlc.narg(iban), "iban"),
    "bic" = COALESCE(sqlc.narg(bic), "bic"),
    "paypal_account" = COALESCE(sqlc.narg(paypal_account), "paypal_account"),
    "paypal_id" = COALESCE(sqlc.narg(paypal_id), "paypal_id"),
    "payment_system" = COALESCE(sqlc.narg(payment_system), "payment_system"),
    "type" = COALESCE(sqlc.narg(type), "type"),
    "changer" = $2,
    "changed" = now()
WHERE "id" = $1
RETURNING *;

-- name: DeletePayment :exec
DELETE FROM payments
WHERE "id" = $1;