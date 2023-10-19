package api

import (
	"bytes"
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"reflect"
	"testing"
	"time"

	"github.com/gin-gonic/gin"
	mockdb "github.com/itsscb/df/bff/db/mock"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/token"
	"github.com/itsscb/df/bff/util"
	"github.com/stretchr/testify/require"
	"go.uber.org/mock/gomock"
)

var timestamp = time.Now()

type eqCreateAccountTxParamsMatcher struct {
	arg      db.CreateAccountTxParams
	password string
	user     db.Account
}

func (expected eqCreateAccountTxParamsMatcher) Matches(x interface{}) bool {
	actualArg, ok := x.(db.CreateAccountTxParams)
	if !ok {
		return false
	}

	err := util.CheckPassword(expected.password, actualArg.Passwordhash)
	if err != nil {
		return false
	}

	expected.arg.Passwordhash = actualArg.Passwordhash
	if !reflect.DeepEqual(expected.arg.CreateAccountParams, actualArg.CreateAccountParams) {
		return false
	}

	err = actualArg.AfterCreate(expected.user)
	return err == nil
}

func (e eqCreateAccountTxParamsMatcher) String() string {
	return fmt.Sprintf("matches arg %v and password %v", e.arg, e.password)
}

func EqCreateAccountTxParams(arg db.CreateAccountTxParams, password string, user db.Account) gomock.Matcher {
	return eqCreateAccountTxParamsMatcher{arg, password, user}
}

func TestCreateAccountAPI(t *testing.T) {
	account, password := randomAccount()

	// fn := func(db.Account) error { return nil}

	testCases := []struct {
		name          string
		body          gin.H
		setupAuth     func(t *testing.T, request *http.Request, tokenMaker token.Maker)
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recorder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			body: gin.H{
				"passwordhash": account.Passwordhash,
				"email":        account.Email,
				"secret_key":   account.SecretKey,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.CreateAccountTxParams{
					CreateAccountParams: db.CreateAccountParams{
						Passwordhash: account.Passwordhash,
						Email:        account.Email,
						SecretKey:    account.SecretKey,
					},
					AfterCreate: func(a db.Account) error { return nil },
				}

				store.EXPECT().
					CreateAccountTx(gomock.Any(), EqCreateAccountTxParams(arg, password, account)).
					Times(1).
					Return(account, nil)

				// store.EXPECT().
				// 	CreateAccountTx(gomock.Any(), gomock.Eq(arg)).
				// 	Times(1).
				// 	Return(account, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				requireBodyMatchAccount(t, recorder.Body, account)
			},
		},
		// {
		// 	name: "NoAuthorization",
		// 	body: gin.H{
		// 		"passwordhash":     account.Passwordhash,
		// 		"privacy_accepted": account.PrivacyAccepted.Bool,
		// 		"firstname":        account.Firstname,
		// 		"lastname":         account.Lastname,
		// 		"birthday":         account.Birthday,
		// 		"email":            account.Email,
		// 		"city":             account.City,
		// 		"zip":              account.Zip,
		// 		"street":           account.Street,
		// 		"country":          account.Country,
		// 		"phone":            account.Phone.String,
		// 		"creator":          account.Email,
		// 	},
		// 	setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			CreateAccountTx(gomock.Any(), gomock.Any()).
		// 			Times(0)
		// 	},
		// 	checkResponse: func(recorder *httptest.ResponseRecorder) {
		// 		require.Equal(t, http.StatusUnauthorized, recorder.Code)
		// 	},
		// },
		{
			name: "BadRequest",
			body: gin.H{
				"email": account.Email,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					CreateAccountTx(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
		{
			name: "InternalServerError",
			body: gin.H{
				"passwordhash": account.Passwordhash,
				"email":        account.Email,
				"secret_key":   account.SecretKey.String,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					CreateAccountTx(gomock.Any(), gomock.Any()).
					Times(1).
					Return(db.Account{}, sql.ErrConnDone)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusInternalServerError, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server, err := NewServer(config, store, nil)
			require.NoError(t, err)

			recorder := httptest.NewRecorder()

			// Marshal body data to JSON
			data, err := json.Marshal(tc.body)
			require.NoError(t, err)

			url := "/accounts"
			request, err := http.NewRequest(http.MethodPost, url, bytes.NewReader(data))
			require.NoError(t, err)

			tc.setupAuth(t, request, server.tokenMaker)
			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func TestGetAccountAPI(t *testing.T) {
	account, _ := randomAccount()

	testCases := []struct {
		name          string
		accountID     uint64
		setupAuth     func(t *testing.T, request *http.Request, tokenMaker token.Maker)
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(t *testing.T, recorder *httptest.ResponseRecorder)
	}{
		{
			name:      "OK",
			accountID: account.ID,
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(account, nil)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				requireBodyMatchAccount(t, recorder.Body, account)
			},
		},
		{
			name:      "UnauthorizedUser",
			accountID: account.ID,
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, 2, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(account, nil)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusUnauthorized, recorder.Code)
			},
		},
		{
			name:      "NoAuthorization",
			accountID: account.ID,
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusUnauthorized, recorder.Code)
			},
		},
		{
			name:      "NotFound",
			accountID: account.ID,
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(db.Account{}, sql.ErrNoRows)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusNotFound, recorder.Code)
			},
		},
		{
			name:      "InternalError",
			accountID: account.ID,
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(db.Account{}, sql.ErrConnDone)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusInternalServerError, recorder.Code)
			},
		},
		{
			name:      "InvalidID",
			accountID: 0,
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server, err := NewServer(config, store, nil)
			require.NoError(t, err)
			recorder := httptest.NewRecorder()

			url := fmt.Sprintf("/accounts/%d", tc.accountID)
			request, err := http.NewRequest(http.MethodGet, url, nil)
			require.NoError(t, err)

			tc.setupAuth(t, request, server.tokenMaker)
			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(t, recorder)
		})
	}
}

func TestUpdateAccountInfoTxAPI(t *testing.T) {
	account, _ := randomAccount()
	newLastname := util.RandomName()

	testCases := []struct {
		name          string
		body          gin.H
		accountID     string
		setupAuth     func(t *testing.T, request *http.Request, tokenMaker token.Maker)
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recorder *httptest.ResponseRecorder)
	}{
		// {
		// 	name: "OK_PasswordHash",
		// 	body: gin.H{
		// 		"id":           account.ID,
		// 		"passwordhash": newPassword,
		// 		"changer":      changer,
		// 	},
		// 	setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
		// 		addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.Email, time.Minute)
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		var err error
		// 		accountTemp := account
		// 		accountTemp.Passwordhash, err = util.HashPassword(newPassword)
		// 		require.NoError(t, err)
		// 		accountTemp.Changer = changer
		// 		arg := db.UpdateAccountInfoTxParams{
		// 			ID: account.ID,
		// 			Passwordhash: sql.NullString{
		// 				Valid:  true,
		// 				String: newPassword,
		// 			},
		// 			Changer: changer,
		// 		}

		// 		store.EXPECT().
		// 			UpdateAccountInfoTx(gomock.Any(), gomock.Eq(arg)).
		// 			Times(1).
		// 			Return(accountTemp, nil)
		// 	},
		// 	checkResponse: func(recorder *httptest.ResponseRecorder) {
		// 		require.Equal(t, http.StatusOK, recorder.Code)

		// 		accountTemp := account
		// 		accountTemp.Passwordhash = newPassword
		// 		accountTemp.Changer = changer

		// 		requireBodyMatchAccount(t, recorder.Body, accountTemp)
		// 	},
		// },
		{
			name: "OK_Lastname",
			body: gin.H{
				"id":       account.ID,
				"lastname": newLastname,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.UpdateAccountInfoTxParams{
					AccountID: account.ID,
					Lastname: sql.NullString{
						Valid:  true,
						String: newLastname,
					},
					Changer: account.Email,
				}

				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(account, nil)

				store.EXPECT().
					UpdateAccountInfoTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				requireBodyMatchAccount(t, recorder.Body, account)
			},
		},
		{
			name: "NoAuthorization",
			body: gin.H{
				"id":       account.ID,
				"lastname": newLastname,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					CreateAccount(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusUnauthorized, recorder.Code)
			},
		},
		{
			name: "BadRequest",
			body: gin.H{
				"email": account.Email,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					CreateAccount(gomock.Any(), gomock.Any()).
					Times(0).
					Return(db.Account{}, sql.ErrConnDone)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server, err := NewServer(config, store, nil)
			require.NoError(t, err)

			recorder := httptest.NewRecorder()

			// Marshal body data to JSON
			data, err := json.Marshal(tc.body)
			require.NoError(t, err)

			url := "/accounts"
			request, err := http.NewRequest(http.MethodPut, url, bytes.NewReader(data))
			require.NoError(t, err)

			tc.setupAuth(t, request, server.tokenMaker)
			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func TestListAccountsAPI(t *testing.T) {

	n := 5
	accounts := make([]db.Account, n)
	for i := 0; i < n; i++ {
		accounts[i], _ = randomAccount()
	}
	account := accounts[1]

	type Query struct {
		pageID   int
		pageSize int
	}

	testCases := []struct {
		name          string
		query         Query
		setupAuth     func(t *testing.T, request *http.Request, tokenMaker token.Maker)
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recorder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			query: Query{
				pageID:   1,
				pageSize: n,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.ListAccountsParams{
					Limit:  int32(n),
					Offset: 0,
				}

				accountAdmin := account
				accountAdmin.PermissionLevel = 1

				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(accountAdmin, nil)

				store.EXPECT().
					ListAccounts(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(accounts, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				requireBodyMatchAccounts(t, recorder.Body, accounts)
			},
		},
		{
			name: "NoAuthorization",
			query: Query{
				pageID:   1,
				pageSize: n,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					ListAccounts(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusUnauthorized, recorder.Code)
			},
		},
		{
			name:  "EmptyQuery",
			query: Query{},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					ListAccounts(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
		{
			name: "InvalidPageID",
			query: Query{
				pageID:   -1,
				pageSize: n,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					ListAccounts(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
		{
			name: "InvalidPageSize",
			query: Query{
				pageID:   1,
				pageSize: 100000,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					ListAccounts(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server, err := NewServer(config, store, nil)
			require.NoError(t, err)

			recorder := httptest.NewRecorder()

			url := "/accounts"
			request, err := http.NewRequest(http.MethodGet, url, nil)
			require.NoError(t, err)

			// Add query parameters to request URL
			q := request.URL.Query()
			q.Add("page_id", fmt.Sprintf("%d", tc.query.pageID))
			q.Add("page_size", fmt.Sprintf("%d", tc.query.pageSize))
			request.URL.RawQuery = q.Encode()

			tc.setupAuth(t, request, server.tokenMaker)
			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func TestUpdateAccountPrivacyTxAPI(t *testing.T) {
	account, _ := randomAccount()

	testCases := []struct {
		name          string
		body          gin.H
		setupAuth     func(t *testing.T, request *http.Request, tokenMaker token.Maker)
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recorder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			body: gin.H{
				"id":               account.ID,
				"privacy_accepted": true,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				trueBool := true
				arg := db.UpdateAccountPrivacyTxParams{
					ID:              account.ID,
					PrivacyAccepted: &trueBool,
					Changer:         account.Email,
				}

				account2 := account

				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(account, nil)

				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account2, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				data, err := io.ReadAll(recorder.Body)
				require.NoError(t, err)

				var getAccount db.Account
				err = json.Unmarshal(data, &getAccount)
				require.NoError(t, err)

				require.Equal(t, account.ID, getAccount.ID)
			},
		},
		{
			name: "OK",
			body: gin.H{
				"id":               account.ID,
				"privacy_accepted": true,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				trueBool := true

				arg := db.UpdateAccountPrivacyTxParams{
					ID:              account.ID,
					PrivacyAccepted: &trueBool,
					Changer:         account.Email,
				}

				account2 := account

				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(account, nil)

				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account2, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				data, err := io.ReadAll(recorder.Body)
				require.NoError(t, err)

				var getAccount db.Account
				err = json.Unmarshal(data, &getAccount)
				require.NoError(t, err)

				require.Equal(t, account.ID, getAccount.ID)
			},
		},
		{
			name: "Revoked",
			body: gin.H{
				"id":               account.ID,
				"privacy_accepted": false,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				falseBool := false

				arg := db.UpdateAccountPrivacyTxParams{
					ID:              account.ID,
					PrivacyAccepted: &falseBool,
					Changer:         account.Email,
				}

				account2 := account

				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(1).
					Return(account, nil)

				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account2, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				data, err := io.ReadAll(recorder.Body)
				require.NoError(t, err)

				var getAccount db.Account
				err = json.Unmarshal(data, &getAccount)
				require.NoError(t, err)

				require.Equal(t, account.ID, getAccount.ID)

			},
		}, {
			name: "InvalidRequest",
			body: gin.H{
				"id": account.ID,
			},
			setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
				addAuthorization(t, request, tokenMaker, authorizationTypeBearer, account.ID, time.Minute)
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					GetAccount(gomock.Any(), gomock.Eq(account.ID)).
					Times(0)

				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]

		t.Run(tc.name, func(t *testing.T) {
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server, err := NewServer(config, store, nil)
			require.NoError(t, err)

			recorder := httptest.NewRecorder()

			// Marshal body data to JSON
			data, err := json.Marshal(tc.body)
			require.NoError(t, err)
			fmt.Println("privacy revoked", "body", string(data))

			url := "/accounts/privacy"
			request, err := http.NewRequest(http.MethodPut, url, bytes.NewReader(data))
			require.NoError(t, err)

			tc.setupAuth(t, request, server.tokenMaker)
			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func randomAccount() (db.Account, string) {
	password := util.RandomString(6)
	hashedPassword, _ := util.HashPassword(password)

	email := util.RandomEmail()
	acc := db.Account{
		ID:           util.RandomInt(1, 1000),
		Passwordhash: hashedPassword,
		Email:        email,
		SecretKey: sql.NullString{
			String: util.RandomString(100),
			Valid:  true,
		},
	}

	return acc, password
}

func createRandomAccountInfo(t *testing.T) db.AccountInfo {

	creator := util.RandomName()

	arg := db.CreateAccountInfoParams{
		Firstname: util.RandomName(),
		Lastname:  util.RandomName(),
		Birthday:  time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Phone: sql.NullString{
			Valid:  true,
			String: util.RandomPhone(),
		},
		PrivacyAccepted: sql.NullBool{
			Valid: true,
			Bool:  true,
		},
		PrivacyAcceptedDate: sql.NullTime{
			Valid: true,
			Time:  timestamp,
		},
		City:    util.RandomString(15),
		Zip:     util.RandomString(5),
		Street:  util.RandomString(20),
		Country: util.RandomString(15),
		Creator: creator,
	}

	account_info, err := testQueries.CreateAccountInfo(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account_info)

	require.Equal(t, arg.Firstname, account_info.Firstname)
	require.Equal(t, arg.Lastname, account_info.Lastname)
	require.Equal(t, arg.Birthday, account_info.Birthday)
	require.Equal(t, arg.Phone, account_info.Phone)
	require.Equal(t, arg.City, account_info.City)
	require.Equal(t, arg.Zip, account_info.Zip)
	require.Equal(t, arg.Street, account_info.Street)
	require.Equal(t, arg.Country, account_info.Country)
	require.Equal(t, arg.Creator, account_info.Creator)
	require.Equal(t, arg.Creator, account_info.Changer)

	require.NotZero(t, account_info.ID)
	require.NotZero(t, account_info.Created)

	return account_info
}

func requireBodyMatchAccount(t *testing.T, body *bytes.Buffer, account db.Account) {
	data, err := io.ReadAll(body)
	require.NoError(t, err)

	var getAccount db.Account
	err = json.Unmarshal(data, &getAccount)
	require.NoError(t, err)
	require.Equal(t, account.Passwordhash, getAccount.Passwordhash)
	require.Equal(t, account.Email, getAccount.Email)
	require.Equal(t, account.SecretKey, getAccount.SecretKey)
	// require.WithinDuration(t, account.PrivacyAcceptedDate.Time, getAccount.PrivacyAcceptedDate.Time, time.Minute)
}

func requireBodyMatchAccounts(t *testing.T, body *bytes.Buffer, accounts []db.Account) {
	data, err := io.ReadAll(body)
	require.NoError(t, err)

	var gotAccounts []db.Account
	err = json.Unmarshal(data, &gotAccounts)
	require.NoError(t, err)

	for i := range accounts {
		a := accounts[i]
		b := gotAccounts[i]

		require.Equal(t, a.Passwordhash, b.Passwordhash)
		require.Equal(t, a.Email, b.Email)
		require.Equal(t, a.SecretKey, b.SecretKey)
	}
	// require.Equal(t, accounts, gotAccounts)

}
