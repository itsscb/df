// Code generated by MockGen. DO NOT EDIT.
// Source: github.com/itsscb/df/db/sqlc (interfaces: Store)
//
// Generated by this command:
//
//	mockgen -package mockdb -destination db/mock/store.go github.com/itsscb/df/db/sqlc Store
//
// Package mockdb is a generated GoMock package.
package mockdb

import (
	context "context"
	reflect "reflect"

	db "github.com/itsscb/df/db/sqlc"
	gomock "go.uber.org/mock/gomock"
)

// MockStore is a mock of Store interface.
type MockStore struct {
	ctrl     *gomock.Controller
	recorder *MockStoreMockRecorder
}

// MockStoreMockRecorder is the mock recorder for MockStore.
type MockStoreMockRecorder struct {
	mock *MockStore
}

// NewMockStore creates a new mock instance.
func NewMockStore(ctrl *gomock.Controller) *MockStore {
	mock := &MockStore{ctrl: ctrl}
	mock.recorder = &MockStoreMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockStore) EXPECT() *MockStoreMockRecorder {
	return m.recorder
}

// CreateAccount mocks base method.
func (m *MockStore) CreateAccount(arg0 context.Context, arg1 db.CreateAccountParams) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateAccount", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateAccount indicates an expected call of CreateAccount.
func (mr *MockStoreMockRecorder) CreateAccount(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateAccount", reflect.TypeOf((*MockStore)(nil).CreateAccount), arg0, arg1)
}

// CreateAccountTx mocks base method.
func (m *MockStore) CreateAccountTx(arg0 context.Context, arg1 db.CreateAccountTxParams) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateAccountTx", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateAccountTx indicates an expected call of CreateAccountTx.
func (mr *MockStoreMockRecorder) CreateAccountTx(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateAccountTx", reflect.TypeOf((*MockStore)(nil).CreateAccountTx), arg0, arg1)
}

// CreateDocumentMail mocks base method.
func (m *MockStore) CreateDocumentMail(arg0 context.Context, arg1 db.CreateDocumentMailParams) (db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateDocumentMail", arg0, arg1)
	ret0, _ := ret[0].(db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateDocumentMail indicates an expected call of CreateDocumentMail.
func (mr *MockStoreMockRecorder) CreateDocumentMail(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateDocumentMail", reflect.TypeOf((*MockStore)(nil).CreateDocumentMail), arg0, arg1)
}

// CreateDocumentUpload mocks base method.
func (m *MockStore) CreateDocumentUpload(arg0 context.Context, arg1 db.CreateDocumentUploadParams) (db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateDocumentUpload", arg0, arg1)
	ret0, _ := ret[0].(db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateDocumentUpload indicates an expected call of CreateDocumentUpload.
func (mr *MockStoreMockRecorder) CreateDocumentUpload(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateDocumentUpload", reflect.TypeOf((*MockStore)(nil).CreateDocumentUpload), arg0, arg1)
}

// CreateMail mocks base method.
func (m *MockStore) CreateMail(arg0 context.Context, arg1 db.CreateMailParams) (db.Mail, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateMail", arg0, arg1)
	ret0, _ := ret[0].(db.Mail)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateMail indicates an expected call of CreateMail.
func (mr *MockStoreMockRecorder) CreateMail(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateMail", reflect.TypeOf((*MockStore)(nil).CreateMail), arg0, arg1)
}

// CreatePayment mocks base method.
func (m *MockStore) CreatePayment(arg0 context.Context, arg1 db.CreatePaymentParams) (db.Payment, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreatePayment", arg0, arg1)
	ret0, _ := ret[0].(db.Payment)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreatePayment indicates an expected call of CreatePayment.
func (mr *MockStoreMockRecorder) CreatePayment(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreatePayment", reflect.TypeOf((*MockStore)(nil).CreatePayment), arg0, arg1)
}

// CreatePerson mocks base method.
func (m *MockStore) CreatePerson(arg0 context.Context, arg1 db.CreatePersonParams) (db.Person, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreatePerson", arg0, arg1)
	ret0, _ := ret[0].(db.Person)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreatePerson indicates an expected call of CreatePerson.
func (mr *MockStoreMockRecorder) CreatePerson(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreatePerson", reflect.TypeOf((*MockStore)(nil).CreatePerson), arg0, arg1)
}

// CreateProvider mocks base method.
func (m *MockStore) CreateProvider(arg0 context.Context, arg1 db.CreateProviderParams) (db.Provider, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateProvider", arg0, arg1)
	ret0, _ := ret[0].(db.Provider)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateProvider indicates an expected call of CreateProvider.
func (mr *MockStoreMockRecorder) CreateProvider(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateProvider", reflect.TypeOf((*MockStore)(nil).CreateProvider), arg0, arg1)
}

// CreateReturn mocks base method.
func (m *MockStore) CreateReturn(arg0 context.Context, arg1 db.CreateReturnParams) (db.Return, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateReturn", arg0, arg1)
	ret0, _ := ret[0].(db.Return)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateReturn indicates an expected call of CreateReturn.
func (mr *MockStoreMockRecorder) CreateReturn(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateReturn", reflect.TypeOf((*MockStore)(nil).CreateReturn), arg0, arg1)
}

// CreateReturnsLog mocks base method.
func (m *MockStore) CreateReturnsLog(arg0 context.Context, arg1 db.CreateReturnsLogParams) (db.ReturnsLog, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateReturnsLog", arg0, arg1)
	ret0, _ := ret[0].(db.ReturnsLog)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateReturnsLog indicates an expected call of CreateReturnsLog.
func (mr *MockStoreMockRecorder) CreateReturnsLog(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateReturnsLog", reflect.TypeOf((*MockStore)(nil).CreateReturnsLog), arg0, arg1)
}

// DeleteAccount mocks base method.
func (m *MockStore) DeleteAccount(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteAccount", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteAccount indicates an expected call of DeleteAccount.
func (mr *MockStoreMockRecorder) DeleteAccount(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteAccount", reflect.TypeOf((*MockStore)(nil).DeleteAccount), arg0, arg1)
}

// DeleteDocument mocks base method.
func (m *MockStore) DeleteDocument(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteDocument", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteDocument indicates an expected call of DeleteDocument.
func (mr *MockStoreMockRecorder) DeleteDocument(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteDocument", reflect.TypeOf((*MockStore)(nil).DeleteDocument), arg0, arg1)
}

// DeleteMail mocks base method.
func (m *MockStore) DeleteMail(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteMail", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteMail indicates an expected call of DeleteMail.
func (mr *MockStoreMockRecorder) DeleteMail(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteMail", reflect.TypeOf((*MockStore)(nil).DeleteMail), arg0, arg1)
}

// DeletePayment mocks base method.
func (m *MockStore) DeletePayment(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeletePayment", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeletePayment indicates an expected call of DeletePayment.
func (mr *MockStoreMockRecorder) DeletePayment(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeletePayment", reflect.TypeOf((*MockStore)(nil).DeletePayment), arg0, arg1)
}

// DeletePerson mocks base method.
func (m *MockStore) DeletePerson(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeletePerson", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeletePerson indicates an expected call of DeletePerson.
func (mr *MockStoreMockRecorder) DeletePerson(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeletePerson", reflect.TypeOf((*MockStore)(nil).DeletePerson), arg0, arg1)
}

// DeleteProvider mocks base method.
func (m *MockStore) DeleteProvider(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteProvider", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteProvider indicates an expected call of DeleteProvider.
func (mr *MockStoreMockRecorder) DeleteProvider(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteProvider", reflect.TypeOf((*MockStore)(nil).DeleteProvider), arg0, arg1)
}

// DeleteReturn mocks base method.
func (m *MockStore) DeleteReturn(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteReturn", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteReturn indicates an expected call of DeleteReturn.
func (mr *MockStoreMockRecorder) DeleteReturn(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteReturn", reflect.TypeOf((*MockStore)(nil).DeleteReturn), arg0, arg1)
}

// DeleteReturnsLog mocks base method.
func (m *MockStore) DeleteReturnsLog(arg0 context.Context, arg1 int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteReturnsLog", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteReturnsLog indicates an expected call of DeleteReturnsLog.
func (mr *MockStoreMockRecorder) DeleteReturnsLog(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteReturnsLog", reflect.TypeOf((*MockStore)(nil).DeleteReturnsLog), arg0, arg1)
}

// GetAccount mocks base method.
func (m *MockStore) GetAccount(arg0 context.Context, arg1 int64) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetAccount", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetAccount indicates an expected call of GetAccount.
func (mr *MockStoreMockRecorder) GetAccount(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetAccount", reflect.TypeOf((*MockStore)(nil).GetAccount), arg0, arg1)
}

// GetAccountForUpdate mocks base method.
func (m *MockStore) GetAccountForUpdate(arg0 context.Context, arg1 int64) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetAccountForUpdate", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetAccountForUpdate indicates an expected call of GetAccountForUpdate.
func (mr *MockStoreMockRecorder) GetAccountForUpdate(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetAccountForUpdate", reflect.TypeOf((*MockStore)(nil).GetAccountForUpdate), arg0, arg1)
}

// GetDocument mocks base method.
func (m *MockStore) GetDocument(arg0 context.Context, arg1 int64) (db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetDocument", arg0, arg1)
	ret0, _ := ret[0].(db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetDocument indicates an expected call of GetDocument.
func (mr *MockStoreMockRecorder) GetDocument(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetDocument", reflect.TypeOf((*MockStore)(nil).GetDocument), arg0, arg1)
}

// GetMail mocks base method.
func (m *MockStore) GetMail(arg0 context.Context, arg1 int64) (db.Mail, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetMail", arg0, arg1)
	ret0, _ := ret[0].(db.Mail)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetMail indicates an expected call of GetMail.
func (mr *MockStoreMockRecorder) GetMail(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetMail", reflect.TypeOf((*MockStore)(nil).GetMail), arg0, arg1)
}

// GetPayment mocks base method.
func (m *MockStore) GetPayment(arg0 context.Context, arg1 int64) (db.Payment, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetPayment", arg0, arg1)
	ret0, _ := ret[0].(db.Payment)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetPayment indicates an expected call of GetPayment.
func (mr *MockStoreMockRecorder) GetPayment(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetPayment", reflect.TypeOf((*MockStore)(nil).GetPayment), arg0, arg1)
}

// GetPerson mocks base method.
func (m *MockStore) GetPerson(arg0 context.Context, arg1 int64) (db.Person, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetPerson", arg0, arg1)
	ret0, _ := ret[0].(db.Person)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetPerson indicates an expected call of GetPerson.
func (mr *MockStoreMockRecorder) GetPerson(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetPerson", reflect.TypeOf((*MockStore)(nil).GetPerson), arg0, arg1)
}

// GetProvider mocks base method.
func (m *MockStore) GetProvider(arg0 context.Context, arg1 int64) (db.Provider, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetProvider", arg0, arg1)
	ret0, _ := ret[0].(db.Provider)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetProvider indicates an expected call of GetProvider.
func (mr *MockStoreMockRecorder) GetProvider(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetProvider", reflect.TypeOf((*MockStore)(nil).GetProvider), arg0, arg1)
}

// GetReturn mocks base method.
func (m *MockStore) GetReturn(arg0 context.Context, arg1 int64) (db.Return, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetReturn", arg0, arg1)
	ret0, _ := ret[0].(db.Return)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetReturn indicates an expected call of GetReturn.
func (mr *MockStoreMockRecorder) GetReturn(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetReturn", reflect.TypeOf((*MockStore)(nil).GetReturn), arg0, arg1)
}

// GetReturnsLog mocks base method.
func (m *MockStore) GetReturnsLog(arg0 context.Context, arg1 int64) (db.ReturnsLog, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetReturnsLog", arg0, arg1)
	ret0, _ := ret[0].(db.ReturnsLog)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetReturnsLog indicates an expected call of GetReturnsLog.
func (mr *MockStoreMockRecorder) GetReturnsLog(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetReturnsLog", reflect.TypeOf((*MockStore)(nil).GetReturnsLog), arg0, arg1)
}

// InvalidateDocument mocks base method.
func (m *MockStore) InvalidateDocument(arg0 context.Context, arg1 db.InvalidateDocumentParams) (db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "InvalidateDocument", arg0, arg1)
	ret0, _ := ret[0].(db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// InvalidateDocument indicates an expected call of InvalidateDocument.
func (mr *MockStoreMockRecorder) InvalidateDocument(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "InvalidateDocument", reflect.TypeOf((*MockStore)(nil).InvalidateDocument), arg0, arg1)
}

// ListAccounts mocks base method.
func (m *MockStore) ListAccounts(arg0 context.Context, arg1 db.ListAccountsParams) ([]db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListAccounts", arg0, arg1)
	ret0, _ := ret[0].([]db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListAccounts indicates an expected call of ListAccounts.
func (mr *MockStoreMockRecorder) ListAccounts(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListAccounts", reflect.TypeOf((*MockStore)(nil).ListAccounts), arg0, arg1)
}

// ListDocuments mocks base method.
func (m *MockStore) ListDocuments(arg0 context.Context, arg1 db.ListDocumentsParams) ([]db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListDocuments", arg0, arg1)
	ret0, _ := ret[0].([]db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListDocuments indicates an expected call of ListDocuments.
func (mr *MockStoreMockRecorder) ListDocuments(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListDocuments", reflect.TypeOf((*MockStore)(nil).ListDocuments), arg0, arg1)
}

// ListMails mocks base method.
func (m *MockStore) ListMails(arg0 context.Context, arg1 db.ListMailsParams) ([]db.Mail, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListMails", arg0, arg1)
	ret0, _ := ret[0].([]db.Mail)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListMails indicates an expected call of ListMails.
func (mr *MockStoreMockRecorder) ListMails(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListMails", reflect.TypeOf((*MockStore)(nil).ListMails), arg0, arg1)
}

// ListPayments mocks base method.
func (m *MockStore) ListPayments(arg0 context.Context, arg1 db.ListPaymentsParams) ([]db.Payment, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListPayments", arg0, arg1)
	ret0, _ := ret[0].([]db.Payment)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListPayments indicates an expected call of ListPayments.
func (mr *MockStoreMockRecorder) ListPayments(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListPayments", reflect.TypeOf((*MockStore)(nil).ListPayments), arg0, arg1)
}

// ListPersons mocks base method.
func (m *MockStore) ListPersons(arg0 context.Context, arg1 db.ListPersonsParams) ([]db.Person, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListPersons", arg0, arg1)
	ret0, _ := ret[0].([]db.Person)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListPersons indicates an expected call of ListPersons.
func (mr *MockStoreMockRecorder) ListPersons(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListPersons", reflect.TypeOf((*MockStore)(nil).ListPersons), arg0, arg1)
}

// ListProviders mocks base method.
func (m *MockStore) ListProviders(arg0 context.Context, arg1 db.ListProvidersParams) ([]db.Provider, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListProviders", arg0, arg1)
	ret0, _ := ret[0].([]db.Provider)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListProviders indicates an expected call of ListProviders.
func (mr *MockStoreMockRecorder) ListProviders(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListProviders", reflect.TypeOf((*MockStore)(nil).ListProviders), arg0, arg1)
}

// ListReturns mocks base method.
func (m *MockStore) ListReturns(arg0 context.Context, arg1 db.ListReturnsParams) ([]db.Return, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListReturns", arg0, arg1)
	ret0, _ := ret[0].([]db.Return)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListReturns indicates an expected call of ListReturns.
func (mr *MockStoreMockRecorder) ListReturns(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListReturns", reflect.TypeOf((*MockStore)(nil).ListReturns), arg0, arg1)
}

// ListReturnsLogs mocks base method.
func (m *MockStore) ListReturnsLogs(arg0 context.Context, arg1 db.ListReturnsLogsParams) ([]db.ReturnsLog, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ListReturnsLogs", arg0, arg1)
	ret0, _ := ret[0].([]db.ReturnsLog)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ListReturnsLogs indicates an expected call of ListReturnsLogs.
func (mr *MockStoreMockRecorder) ListReturnsLogs(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ListReturnsLogs", reflect.TypeOf((*MockStore)(nil).ListReturnsLogs), arg0, arg1)
}

// UpdateAccount mocks base method.
func (m *MockStore) UpdateAccount(arg0 context.Context, arg1 db.UpdateAccountParams) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateAccount", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateAccount indicates an expected call of UpdateAccount.
func (mr *MockStoreMockRecorder) UpdateAccount(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateAccount", reflect.TypeOf((*MockStore)(nil).UpdateAccount), arg0, arg1)
}

// UpdateAccountPrivacy mocks base method.
func (m *MockStore) UpdateAccountPrivacy(arg0 context.Context, arg1 db.UpdateAccountPrivacyParams) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateAccountPrivacy", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateAccountPrivacy indicates an expected call of UpdateAccountPrivacy.
func (mr *MockStoreMockRecorder) UpdateAccountPrivacy(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateAccountPrivacy", reflect.TypeOf((*MockStore)(nil).UpdateAccountPrivacy), arg0, arg1)
}

// UpdateAccountPrivacyTx mocks base method.
func (m *MockStore) UpdateAccountPrivacyTx(arg0 context.Context, arg1 db.UpdateAccountPrivacyTxParams) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateAccountPrivacyTx", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateAccountPrivacyTx indicates an expected call of UpdateAccountPrivacyTx.
func (mr *MockStoreMockRecorder) UpdateAccountPrivacyTx(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateAccountPrivacyTx", reflect.TypeOf((*MockStore)(nil).UpdateAccountPrivacyTx), arg0, arg1)
}

// UpdateAccountTx mocks base method.
func (m *MockStore) UpdateAccountTx(arg0 context.Context, arg1 db.UpdateAccountTxParams) (db.Account, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateAccountTx", arg0, arg1)
	ret0, _ := ret[0].(db.Account)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateAccountTx indicates an expected call of UpdateAccountTx.
func (mr *MockStoreMockRecorder) UpdateAccountTx(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateAccountTx", reflect.TypeOf((*MockStore)(nil).UpdateAccountTx), arg0, arg1)
}

// UpdateDocument mocks base method.
func (m *MockStore) UpdateDocument(arg0 context.Context, arg1 db.UpdateDocumentParams) (db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateDocument", arg0, arg1)
	ret0, _ := ret[0].(db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateDocument indicates an expected call of UpdateDocument.
func (mr *MockStoreMockRecorder) UpdateDocument(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateDocument", reflect.TypeOf((*MockStore)(nil).UpdateDocument), arg0, arg1)
}

// UpdatePayment mocks base method.
func (m *MockStore) UpdatePayment(arg0 context.Context, arg1 db.UpdatePaymentParams) (db.Payment, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdatePayment", arg0, arg1)
	ret0, _ := ret[0].(db.Payment)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdatePayment indicates an expected call of UpdatePayment.
func (mr *MockStoreMockRecorder) UpdatePayment(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdatePayment", reflect.TypeOf((*MockStore)(nil).UpdatePayment), arg0, arg1)
}

// UpdatePerson mocks base method.
func (m *MockStore) UpdatePerson(arg0 context.Context, arg1 db.UpdatePersonParams) (db.Person, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdatePerson", arg0, arg1)
	ret0, _ := ret[0].(db.Person)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdatePerson indicates an expected call of UpdatePerson.
func (mr *MockStoreMockRecorder) UpdatePerson(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdatePerson", reflect.TypeOf((*MockStore)(nil).UpdatePerson), arg0, arg1)
}

// UpdateProvider mocks base method.
func (m *MockStore) UpdateProvider(arg0 context.Context, arg1 db.UpdateProviderParams) (db.Provider, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateProvider", arg0, arg1)
	ret0, _ := ret[0].(db.Provider)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateProvider indicates an expected call of UpdateProvider.
func (mr *MockStoreMockRecorder) UpdateProvider(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateProvider", reflect.TypeOf((*MockStore)(nil).UpdateProvider), arg0, arg1)
}

// UpdateReturn mocks base method.
func (m *MockStore) UpdateReturn(arg0 context.Context, arg1 db.UpdateReturnParams) (db.Return, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateReturn", arg0, arg1)
	ret0, _ := ret[0].(db.Return)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateReturn indicates an expected call of UpdateReturn.
func (mr *MockStoreMockRecorder) UpdateReturn(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateReturn", reflect.TypeOf((*MockStore)(nil).UpdateReturn), arg0, arg1)
}

// UpdateReturnsLog mocks base method.
func (m *MockStore) UpdateReturnsLog(arg0 context.Context, arg1 db.UpdateReturnsLogParams) (db.ReturnsLog, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateReturnsLog", arg0, arg1)
	ret0, _ := ret[0].(db.ReturnsLog)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateReturnsLog indicates an expected call of UpdateReturnsLog.
func (mr *MockStoreMockRecorder) UpdateReturnsLog(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateReturnsLog", reflect.TypeOf((*MockStore)(nil).UpdateReturnsLog), arg0, arg1)
}

// ValidateDocument mocks base method.
func (m *MockStore) ValidateDocument(arg0 context.Context, arg1 db.ValidateDocumentParams) (db.Document, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ValidateDocument", arg0, arg1)
	ret0, _ := ret[0].(db.Document)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// ValidateDocument indicates an expected call of ValidateDocument.
func (mr *MockStoreMockRecorder) ValidateDocument(arg0, arg1 any) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ValidateDocument", reflect.TypeOf((*MockStore)(nil).ValidateDocument), arg0, arg1)
}
