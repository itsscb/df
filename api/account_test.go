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
				"passwordhash": account.Passwordhash,
				"firstname":    account.Firstname,
				"lastname":     account.Lastname,
				"birthday":     account.Birthday,
				"email":        account.Email,
				"city":         account.City,
				"zip":          account.Zip,
				"street":       account.Street,
				"country":      account.Country,
				"phone":        account.Phone.String,
				"creator":      account.Creator,
			},
			buildStubs: func(store *mockdb.MockStore) {
				arg := db.CreateAccountParams{
					Passwordhash: account.Passwordhash,
					Firstname:    account.Firstname,
					Lastname:     account.Lastname,
					Birthday:     account.Birthday,
					Email:        account.Email,
					City:         account.City,
					Zip:          account.Zip,
					Street:       account.Street,
					Country:      account.Country,
					Phone:        account.Phone,
					Creator:      account.Creator,
				}

				store.EXPECT().
					CreateAccount(gomock.Any(), gomock.Eq(arg)).
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
		// {
		// 	name: "BadRequest",
		// 	body: gin.H{
		// 		"email": account.Email,
		// 	},
		// 	buildStubs: func(store *mockdb.MockStore) {
		// 		store.EXPECT().
		// 			CreateAccount(gomock.Any(), gomock.Any()).
		// 			Times(1).
		// 			Return(db.Account{}, sql.ErrConnDone)
		// 	},
		// 	checkResponse: func(recorder *httptest.ResponseRecorder) {
		// 		require.Equal(t, http.StatusBadRequest, recorder.Code)
		// 	},
		// },
		/* 		{
			name: "InvalidCurrency",
			body: gin.H{
				"currency": "invalid",
			},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().
					CreateAccount(gomock.Any(), gomock.Any()).
					Times(0)
			},
			checkResponse: func(recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		}, */
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

	ctrl := gomock.NewController(t)
	defer ctrl.Finish()

	store := mockdb.NewMockStore(ctrl)

	store.EXPECT().GetAccount(gomock.Any(), gomock.Eq(account.ID)).
		Times(1).
		Return(account, nil)

	server := NewServer(config, store)
	recorder := httptest.NewRecorder()

	uri := fmt.Sprintf("/accounts/%d", account.ID)
	req, err := http.NewRequest(http.MethodGet, uri, nil)
	require.NoError(t, err)

	server.router.ServeHTTP(recorder, req)

	require.Equal(t, http.StatusOK, recorder.Code)
	requireBodyMatchAccount(t, recorder.Body, account)
}

func randomAccount() db.Account {
	return db.Account{
		ID:           util.RandomInt(1, 1000),
		Passwordhash: util.RandomString(250),
		Firstname:    util.RandomName(),
		Lastname:     util.RandomName(),
		Email:        util.RandomEmail(),
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
}

func requireBodyMatchAccount(t *testing.T, body *bytes.Buffer, account db.Account) {
	data, err := io.ReadAll(body)
	require.NoError(t, err)

	var getAccount db.Account
	err = json.Unmarshal(data, &getAccount)
	require.NoError(t, err)
	require.Equal(t, account, getAccount)
}
