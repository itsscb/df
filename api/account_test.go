package api

import (
	"bytes"
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"github.com/gin-gonic/gin"
	mockdb "github.com/itsscb/df/db/mock"
	db "github.com/itsscb/df/db/sqlc"
	"github.com/itsscb/df/util"
	"github.com/stretchr/testify/require"
	"go.uber.org/mock/gomock"
)

var timestamp = time.Now()

func TestCreateAccountAPI(t *testing.T) {
	account := randomAccount()

	testCases := []struct {
		name          string
		body          gin.H
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recoder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			body: gin.H{
				"passwordhash":     account.Passwordhash,
				"privacy_accepted": account.PrivacyAccepted.Bool,
				"firstname":        account.Firstname,
				"lastname":         account.Lastname,
				"birthday":         account.Birthday,
				"email":            account.Email,
				"city":             account.City,
				"zip":              account.Zip,
				"street":           account.Street,
				"country":          account.Country,
				"phone":            account.Phone.String,
				"creator":          account.Creator,
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.CreateAccountTxParams{
					Passwordhash:    account.Passwordhash,
					PrivacyAccepted: account.PrivacyAccepted,
					Firstname:       account.Firstname,
					Lastname:        account.Lastname,
					Birthday:        account.Birthday,
					Email:           account.Email,
					City:            account.City,
					Zip:             account.Zip,
					Street:          account.Street,
					Country:         account.Country,
					Phone:           account.Phone,
					Creator:         account.Creator,
				}

				store.EXPECT().
					CreateAccountTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				requireBodyMatchAccount(t, recorder.Body, account)
			},
		},
		// {
		// 	name: "NoAuthorization",
		// 	body: gin.H{
		// 		"currency": account.Currency,
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			CreateAccount(gomock.Any(), gomock.Any()).
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
				"passwordhash":          account.Passwordhash,
				"privacy_accepted":      account.PrivacyAccepted.Bool,
				"privacy_accepted_date": account.PrivacyAcceptedDate.Time,
				"firstname":             account.Firstname,
				"lastname":              account.Lastname,
				"birthday":              account.Birthday,
				"email":                 account.Email,
				"city":                  account.City,
				"zip":                   account.Zip,
				"street":                account.Street,
				"country":               account.Country,
				"phone":                 account.Phone.String,
				"creator":               account.Creator,
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

			server := NewServer(config, store)
			recorder := httptest.NewRecorder()

			// Marshal body data to JSON
			data, err := json.Marshal(tc.body)
			require.NoError(t, err)

			url := "/accounts"
			request, err := http.NewRequest(http.MethodPost, url, bytes.NewReader(data))
			require.NoError(t, err)

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func TestGetAccountAPI(t *testing.T) {
	account := randomAccount()

	testCases := []struct {
		name          string
		accountID     int64
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(t *testing.T, recoder *httptest.ResponseRecorder)
	}{
		{
			name:      "OK",
			accountID: account.ID,
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
		// {
		// 	name:      "UnauthorizedUser",
		// 	accountID: account.ID,
		// 	setupAuth: func(t *testing.T, request *http.Request, tokenMaker token.Maker) {
		// 		addAuthorization(t, request, tokenMaker, authorizationTypeBearer, "unauthorized_user", time.Minute)
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			GetAccount(gomock.Any(), gomock.Eq(account.ID)).
		// 			Times(1).
		// 			Return(account, nil)
		// 	},
		// 	checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
		// 		require.Equal(t, http.StatusUnauthorized, recorder.Code)
		// 	},
		// },
		// {
		// 	name:      "NoAuthorization",
		// 	accountID: account.ID,
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			GetAccount(gomock.Any(), gomock.Any()).
		// 			Times(0)
		// 	},
		// 	checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
		// 		require.Equal(t, http.StatusUnauthorized, recorder.Code)
		// 	},
		// },
		{
			name:      "NotFound",
			accountID: account.ID,
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

			server := NewServer(config, store)
			recorder := httptest.NewRecorder()

			url := fmt.Sprintf("/accounts/%d", tc.accountID)
			request, err := http.NewRequest(http.MethodGet, url, nil)
			require.NoError(t, err)

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(t, recorder)
		})
	}
}

func TestUpdateAccountTxAPI(t *testing.T) {
	account := randomAccount()
	changer := util.RandomName()
	newPassword := util.RandomString(30)
	newEmail := util.RandomEmail()

	testCases := []struct {
		name          string
		body          gin.H
		accountID     string
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recoder *httptest.ResponseRecorder)
	}{
		{
			name: "OK_PasswordHash",
			body: gin.H{
				"id":           account.ID,
				"passwordhash": newPassword,
				"changer":      changer,
			},
			buildStubs: func(store *mockdb.MockStore) {
				accountTemp := account
				accountTemp.Passwordhash = newPassword
				accountTemp.Changer = changer
				arg := db.UpdateAccountTxParams{
					ID: account.ID,
					Passwordhash: sql.NullString{
						Valid:  true,
						String: newPassword,
					},
					Changer: changer,
				}

				store.EXPECT().
					UpdateAccountTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(accountTemp, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)

				accountTemp := account
				accountTemp.Passwordhash = newPassword
				accountTemp.Changer = changer

				requireBodyMatchAccount(t, recorder.Body, accountTemp)
			},
		},
		{
			name: "OK_Email",
			body: gin.H{
				"id":      account.ID,
				"email":   newEmail,
				"changer": changer,
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.UpdateAccountTxParams{
					ID: account.ID,
					Email: sql.NullString{
						Valid:  true,
						String: newEmail,
					},
					Changer: changer,
				}

				store.EXPECT().
					UpdateAccountTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account, nil)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recorder.Code)
				requireBodyMatchAccount(t, recorder.Body, account)
			},
		},
		// {
		// 	name: "OK_PrivacyAccepted",
		// 	body: gin.H{
		// 		"id":               account.ID,
		// 		"privacy_accepted": true,
		// 		"changer":          changer,
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		accountAccepted := account
		// 		accountAccepted.PrivacyAccepted = sql.NullBool{
		// 			Valid: true,
		// 			Bool:  true,
		// 		}
		// 		accountAccepted.PrivacyAcceptedDate = sql.NullTime{
		// 			Valid: true,
		// 			Time:  timestamp,
		// 		}

		// 		arg := db.UpdateAccountTxParams{
		// 			ID: account.ID,
		// 			PrivacyAccepted: sql.NullBool{
		// 				Valid: true,
		// 				Bool:  true,
		// 			},
		// 			Changer: changer,
		// 		}

		// 		store.EXPECT().
		// 			UpdateAccountTx(gomock.Any(), gomock.Eq(arg)).
		// 			Times(1).
		// 			Return(accountAccepted, nil)
		// 	},
		// },
		// {
		// 	name: "NoAuthorization",
		// 	body: gin.H{
		// 		"currency": account.Currency,
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			CreateAccount(gomock.Any(), gomock.Any()).
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

			server := NewServer(config, store)
			recorder := httptest.NewRecorder()

			// Marshal body data to JSON
			data, err := json.Marshal(tc.body)
			require.NoError(t, err)

			url := "/accounts"
			request, err := http.NewRequest(http.MethodPut, url, bytes.NewReader(data))
			require.NoError(t, err)

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func TestListAccountsAPI(t *testing.T) {

	n := 5
	accounts := make([]db.Account, n)
	for i := 0; i < n; i++ {
		accounts[i] = randomAccount()
	}

	type Query struct {
		pageID   int
		pageSize int
	}

	testCases := []struct {
		name          string
		query         Query
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recoder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			query: Query{
				pageID:   1,
				pageSize: n,
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.ListAccountsParams{
					Limit:  int32(n),
					Offset: 0,
				}

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
		// {
		// 	name: "NoAuthorization",
		// 	query: Query{
		// 		pageID:   1,
		// 		pageSize: n,
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			ListAccounts(gomock.Any(), gomock.Any()).
		// 			Times(0)
		// 	},
		// 	checkResponse: func(recorder *httptest.ResponseRecorder) {
		// 		require.Equal(t, http.StatusUnauthorized, recorder.Code)
		// 	},
		// },
		{
			name:  "EmptyQuery",
			query: Query{},
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

			server := NewServer(config, store)
			recorder := httptest.NewRecorder()

			url := "/accounts"
			request, err := http.NewRequest(http.MethodGet, url, nil)
			require.NoError(t, err)

			// Add query parameters to request URL
			q := request.URL.Query()
			q.Add("pageid", fmt.Sprintf("%d", tc.query.pageID))
			q.Add("pagesize", fmt.Sprintf("%d", tc.query.pageSize))
			request.URL.RawQuery = q.Encode()

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func TestUpdateAccountPrivacyTxAPI(t *testing.T) {
	account := randomAccount()
	changer := util.RandomName()

	testCases := []struct {
		name          string
		body          gin.H
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(recoder *httptest.ResponseRecorder)
	}{
		{
			name: "OK",
			body: gin.H{
				"id":               account.ID,
				"changer":          changer,
				"privacy_accepted": true,
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.UpdateAccountPrivacyTxParams{
					ID:              account.ID,
					PrivacyAccepted: true,
					Changer:         changer,
				}

				account2 := account
				account2.PrivacyAccepted.Valid = true
				account2.PrivacyAccepted.Bool = true
				account2.Changer = changer

				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account2, nil)
			},
			checkResponse: func(recoder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recoder.Code)
				data, err := io.ReadAll(recoder.Body)
				require.NoError(t, err)

				var getAccount db.Account
				err = json.Unmarshal(data, &getAccount)
				require.NoError(t, err)

				require.Equal(t, account.ID, getAccount.ID)
				require.Equal(t, true, getAccount.PrivacyAccepted.Bool)
				require.Equal(t, true, getAccount.PrivacyAccepted.Valid)
				require.WithinDuration(t, timestamp, getAccount.PrivacyAcceptedDate.Time, time.Second)
			},
		},
		{
			name: "Revoked",
			body: gin.H{
				"id":               account.ID,
				"changer":          changer,
				"privacy_accepted": false,
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.UpdateAccountPrivacyTxParams{
					ID:              account.ID,
					PrivacyAccepted: false,
					Changer:         changer,
				}

				account2 := account
				account2.PrivacyAccepted.Valid = true
				account2.PrivacyAccepted.Bool = false
				account2.PrivacyAcceptedDate.Valid = true
				account2.PrivacyAcceptedDate.Time = time.Time{}
				account2.Changer = changer

				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Eq(arg)).
					Times(1).
					Return(account2, nil)
			},
			checkResponse: func(recoder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusOK, recoder.Code)
				data, err := io.ReadAll(recoder.Body)
				require.NoError(t, err)

				var getAccount db.Account
				err = json.Unmarshal(data, &getAccount)
				require.NoError(t, err)

				require.Equal(t, account.ID, getAccount.ID)
				require.Equal(t, false, getAccount.PrivacyAccepted.Bool)
				require.Equal(t, true, getAccount.PrivacyAccepted.Valid)
				require.Equal(t, time.Time{}, getAccount.PrivacyAcceptedDate.Time)

			},
		}, {
			name: "OK",
			body: gin.H{
				"id": account.ID,
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					UpdateAccountPrivacyTx(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recoder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recoder.Code)
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

			server := NewServer(config, store)
			recorder := httptest.NewRecorder()

			// Marshal body data to JSON
			data, err := json.Marshal(tc.body)
			require.NoError(t, err)

			url := "/accounts/privacy"
			request, err := http.NewRequest(http.MethodPut, url, bytes.NewReader(data))
			require.NoError(t, err)

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(recorder)
		})
	}
}

func randomAccount() db.Account {
	acc := db.Account{
		ID:           util.RandomInt(1, 1000),
		Passwordhash: util.RandomString(250),
		Firstname:    util.RandomName(),
		Lastname:     util.RandomName(),
		Email:        util.RandomEmail(),
		PrivacyAccepted: sql.NullBool{
			Valid: true,
			Bool:  true,
		},
		PrivacyAcceptedDate: sql.NullTime{
			Valid: true,
			Time:  timestamp,
		},
		Phone: sql.NullString{
			String: util.RandomPhone(),
			Valid:  true,
		},
		Zip:      util.RandomName(),
		Street:   util.RandomName(),
		City:     util.RandomName(),
		Country:  util.RandomName(),
		Creator:  "system",
		Changer:  util.RandomName(),
		Created:  time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Changed:  time.Date(1990, 1, 1, 0, 0, 0, 0, time.UTC),
		Birthday: time.Date(2000, 1, 1, 0, 0, 0, 0, time.UTC),
	}

	return acc
}

func requireBodyMatchAccount(t *testing.T, body *bytes.Buffer, account db.Account) {
	data, err := io.ReadAll(body)
	require.NoError(t, err)

	var getAccount db.Account
	err = json.Unmarshal(data, &getAccount)
	require.NoError(t, err)
	require.Equal(t, account.Firstname, getAccount.Firstname)
	require.Equal(t, account.Lastname, getAccount.Lastname)
	require.Equal(t, account.Passwordhash, getAccount.Passwordhash)
	require.Equal(t, account.Email, getAccount.Email)
	require.Equal(t, account.Phone, getAccount.Phone)
	require.Equal(t, account.City, getAccount.City)
	require.Equal(t, account.Street, getAccount.Street)
	require.Equal(t, account.Country, getAccount.Country)
	require.Equal(t, account.Zip, getAccount.Zip)
	require.Equal(t, account.Creator, getAccount.Creator)
	require.Equal(t, account.PrivacyAccepted, getAccount.PrivacyAccepted)
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

		require.Equal(t, a.Firstname, b.Firstname)
		require.Equal(t, a.Lastname, b.Lastname)
		require.Equal(t, a.Passwordhash, b.Passwordhash)
		require.Equal(t, a.Email, b.Email)
		require.Equal(t, a.Phone, b.Phone)
		require.Equal(t, a.City, b.City)
		require.Equal(t, a.Street, b.Street)
		require.Equal(t, a.Country, b.Country)
		require.Equal(t, a.Zip, b.Zip)
		require.Equal(t, a.Creator, b.Creator)
		require.Equal(t, a.PrivacyAccepted, b.PrivacyAccepted)
	}
	// require.Equal(t, accounts, gotAccounts)

}
