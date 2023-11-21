-- name: GetAccount :one
SELECT * FROM accounts
WHERE "id" = sqlc.arg(id);

-- name: GetAccountByEmail :one
SELECT * FROM accounts
WHERE "email" = sqlc.arg(email);

-- name: CreateAccount :one
INSERT INTO accounts (
    "email",
    "passwordhash",
    "secret_key",
    "verification_sent"
)
VALUES (    
    sqlc.arg(email),
    sqlc.arg(passwordhash),
    sqlc.arg(secret_key),
    now()
)
RETURNING *;

-- name: UpdateAccount :one
UPDATE accounts 
SET
    "email" = COALESCE(sqlc.narg(email), "email"),
    "passwordhash" = COALESCE(sqlc.narg(passwordhash), "passwordhash"),
    "secret_key" = COALESCE(sqlc.narg(secret_key), "secret_key")
WHERE "id" = sqlc.arg(id)
RETURNING *;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY "email"
LIMIT $1
OFFSET $2;

-- name: ResendVerification :one
UPDATE accounts
SET
    "secret_key" = sqlc.arg(secret_key),
    "verification_sent" = now()
WHERE "id" = sqlc.arg(id)
RETURNING *;

-- name: VerifyAccountEmail :exec
UPDATE accounts
SET
    "email_verified" = sqlc.arg(email_verified),
    "email_verified_time" = sqlc.arg(email_verified_time),
    "secret_key" = ''
WHERE "id" = sqlc.arg(id);

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE "id" = sqlc.arg(id);


-- name: GetAccountLevel :one
SELECT
    accounts.id,
    CASE
        WHEN payments.account_id IS NOT NULL THEN 7
        WHEN persons.relationship IS NOT NULL AND persons.relationship <> '' AND persons.relationship = 'sole_heir' THEN 
            CASE
                WHEN (
                    SELECT COUNT(*)
                    FROM documents
                    WHERE person_id = persons.id AND name IN ('death_certificate','id_card','notary_inheritance_certificate')
                ) = 3 THEN 6
            END
        WHEN persons.relationship IS NOT NULL AND persons.relationship <> '' AND persons.relationship <> 'sole_heir' THEN 
            CASE
                WHEN (
                    SELECT COUNT(*)
                    FROM documents
                    WHERE person_id = persons.id AND name IN ('death_certificate','id_card')
                ) = 2 THEN 6
            END
        WHEN (
            SELECT COUNT(*)
            FROM email_addresses
            WHERE person_id = persons.id
        ) > 0 THEN 5
        WHEN persons.relationship IS NOT NULL AND persons.relationship <> '' THEN 4
        WHEN persons.account_id IS NOT NULL THEN 3
        WHEN account_info.account_id IS NOT NULL THEN 2
        WHEN accounts.verified = true THEN 1
        ELSE 0
    END AS account_level
FROM
    accounts
LEFT JOIN account_info ON accounts.id = account_info.account_id
LEFT JOIN persons ON accounts.id = persons.account_id
LEFT JOIN email_addresses ON persons.id = email_addresses.person_id
LEFT JOIN phone_numbers ON persons.id = phone_numbers.person_id
LEFT JOIN documents ON persons.id = documents.person_id
LEFT JOIN payments ON accounts.id = payments.account_id
WHERE accounts.id = sqlc.arg(account_id);
