// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0

package db

import (
	"context"
	"database/sql"

	"github.com/google/uuid"
)

type Querier interface {
	BlockSession(ctx context.Context, id uuid.UUID) error
	CloneProviders(ctx context.Context, arg CloneProvidersParams) error
	CreateAccount(ctx context.Context, arg CreateAccountParams) (Account, error)
	CreateDocumentMail(ctx context.Context, arg CreateDocumentMailParams) (Document, error)
	CreateDocumentUpload(ctx context.Context, arg CreateDocumentUploadParams) (Document, error)
	CreateMail(ctx context.Context, arg CreateMailParams) (Mail, error)
	CreatePayment(ctx context.Context, arg CreatePaymentParams) (Payment, error)
	CreatePerson(ctx context.Context, arg CreatePersonParams) (Person, error)
	CreateProvider(ctx context.Context, arg CreateProviderParams) (Provider, error)
	CreateReturn(ctx context.Context, arg CreateReturnParams) (Return, error)
	CreateReturnsLog(ctx context.Context, arg CreateReturnsLogParams) (ReturnsLog, error)
	CreateSession(ctx context.Context, arg CreateSessionParams) (Session, error)
	DeleteAccount(ctx context.Context, id uint64) error
	DeleteDocument(ctx context.Context, id uint64) error
	DeleteDocumentsByPersonID(ctx context.Context, personID sql.NullInt64) error
	// -- name: UpdateMail :one
	// UPDATE mails
	// SET
	//     "from" = COALESCE(sqlc.narg(from), "from"),
	//     "to" = COALESCE(sqlc.narg(to), "to"),
	//     cc = COALESCE(sqlc.narg(cc), cc),
	//     "subject" = COALESCE(sqlc.narg(subject), "subject"),
	//     body = COALESCE(sqlc.narg(body), body),
	//     "timestamp" = COALESCE(sqlc.narg(timestamp), "timestamp"),
	//     changer = $2,
	//     changed = now()
	// WHERE "id" = $1
	// RETURNING *;
	DeleteMail(ctx context.Context, id uint64) error
	DeletePayment(ctx context.Context, id uint64) error
	DeletePerson(ctx context.Context, id uint64) error
	DeleteProvider(ctx context.Context, id uint64) error
	DeleteReturn(ctx context.Context, id uint64) error
	DeleteReturnsByPersonID(ctx context.Context, personID uint64) error
	DeleteReturnsLog(ctx context.Context, id uint64) error
	DeleteReturnsLogsByPersonID(ctx context.Context, personID uint64) error
	GetAccount(ctx context.Context, id uint64) (Account, error)
	GetAccountByEmail(ctx context.Context, email string) (Account, error)
	GetAccountForUpdate(ctx context.Context, id uint64) (Account, error)
	GetDocument(ctx context.Context, id uint64) (Document, error)
	GetMail(ctx context.Context, id uint64) (Mail, error)
	GetPayment(ctx context.Context, id uint64) (Payment, error)
	GetPerson(ctx context.Context, id uint64) (Person, error)
	GetProvider(ctx context.Context, id uint64) (Provider, error)
	GetReturn(ctx context.Context, id uint64) (Return, error)
	GetReturnIDsByPersonID(ctx context.Context, personID uint64) ([]uint64, error)
	GetReturns(ctx context.Context, id uint64) ([]Return, error)
	GetReturnsLog(ctx context.Context, id uint64) (ReturnsLog, error)
	GetSession(ctx context.Context, id uuid.UUID) (Session, error)
	InvalidateDocument(ctx context.Context, arg InvalidateDocumentParams) (Document, error)
	ListAccounts(ctx context.Context, arg ListAccountsParams) ([]Account, error)
	ListDocuments(ctx context.Context, arg ListDocumentsParams) ([]Document, error)
	ListMails(ctx context.Context, arg ListMailsParams) ([]Mail, error)
	ListPayments(ctx context.Context, accountID uint64) ([]Payment, error)
	ListPersons(ctx context.Context, accountID uint64) ([]Person, error)
	ListProviders(ctx context.Context, arg ListProvidersParams) ([]Provider, error)
	ListReturns(ctx context.Context, arg ListReturnsParams) ([]Return, error)
	ListReturnsLogs(ctx context.Context, arg ListReturnsLogsParams) ([]ReturnsLog, error)
	ListReturnsLogsByPersonID(ctx context.Context, personID uint64) ([]ReturnsLog, error)
	ListSessions(ctx context.Context, accountID uint64) ([]Session, error)
	UpdateAccount(ctx context.Context, arg UpdateAccountParams) (Account, error)
	UpdateAccountPrivacy(ctx context.Context, arg UpdateAccountPrivacyParams) (Account, error)
	UpdateDocument(ctx context.Context, arg UpdateDocumentParams) (Document, error)
	UpdatePayment(ctx context.Context, arg UpdatePaymentParams) (Payment, error)
	UpdatePerson(ctx context.Context, arg UpdatePersonParams) (Person, error)
	UpdateProvider(ctx context.Context, arg UpdateProviderParams) (Provider, error)
	UpdateReturn(ctx context.Context, arg UpdateReturnParams) (Return, error)
	UpdateReturnsLog(ctx context.Context, arg UpdateReturnsLogParams) (ReturnsLog, error)
	ValidateDocument(ctx context.Context, arg ValidateDocumentParams) (Document, error)
}

var _ Querier = (*Queries)(nil)
