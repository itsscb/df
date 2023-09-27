// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.21.0

package db

import (
	"context"
)

type Querier interface {
	CreateAccount(ctx context.Context, arg CreateAccountParams) (Account, error)
	CreateDocumentMail(ctx context.Context, arg CreateDocumentMailParams) (Document, error)
	CreateDocumentUpload(ctx context.Context, arg CreateDocumentUploadParams) (Document, error)
	CreateMail(ctx context.Context, arg CreateMailParams) (Mail, error)
	CreatePayment(ctx context.Context, arg CreatePaymentParams) (Payment, error)
	CreatePerson(ctx context.Context, arg CreatePersonParams) (Person, error)
	CreateProvider(ctx context.Context, arg CreateProviderParams) (Provider, error)
	CreateReturn(ctx context.Context, arg CreateReturnParams) (Return, error)
	CreateReturnsLog(ctx context.Context, arg CreateReturnsLogParams) (ReturnsLog, error)
	DeleteAccount(ctx context.Context, id int64) error
	DeleteDocument(ctx context.Context, id int64) error
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
	DeleteMail(ctx context.Context, id int64) error
	DeletePayment(ctx context.Context, id int64) error
	DeletePerson(ctx context.Context, id int64) error
	DeleteProvider(ctx context.Context, id int64) error
	DeleteReturn(ctx context.Context, id int64) error
	DeleteReturnsLog(ctx context.Context, id int64) error
	GetAccount(ctx context.Context, id int64) (Account, error)
	GetAccountForUpdate(ctx context.Context, id int64) (Account, error)
	GetDocument(ctx context.Context, id int64) (Document, error)
	GetMail(ctx context.Context, id int64) (Mail, error)
	GetPayment(ctx context.Context, id int64) (Payment, error)
	GetPerson(ctx context.Context, id int64) (Person, error)
	GetProvider(ctx context.Context, id int64) (Provider, error)
	GetReturn(ctx context.Context, id int64) (Return, error)
	GetReturnsLog(ctx context.Context, id int64) (ReturnsLog, error)
	InvalidateDocument(ctx context.Context, arg InvalidateDocumentParams) (Document, error)
	ListAccounts(ctx context.Context, arg ListAccountsParams) ([]Account, error)
	ListDocuments(ctx context.Context, arg ListDocumentsParams) ([]Document, error)
	ListMails(ctx context.Context, arg ListMailsParams) ([]Mail, error)
	ListPayments(ctx context.Context, arg ListPaymentsParams) ([]Payment, error)
	ListPersons(ctx context.Context, arg ListPersonsParams) ([]Person, error)
	ListProviders(ctx context.Context, arg ListProvidersParams) ([]Provider, error)
	ListReturns(ctx context.Context, arg ListReturnsParams) ([]Return, error)
	ListReturnsLogs(ctx context.Context, arg ListReturnsLogsParams) ([]ReturnsLog, error)
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
