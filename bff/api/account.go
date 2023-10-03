package api

import (
	"database/sql"
	"errors"
	"fmt"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/token"
	"golang.org/x/exp/slog"
)

type createAccountRequest struct {
	Passwordhash    string    `binding:"required" json:"passwordhash"`
	PrivacyAccepted bool      `json:"privacy_accepted"`
	Firstname       string    `binding:"required" json:"firstname"`
	Lastname        string    `binding:"required" json:"lastname"`
	Birthday        time.Time `binding:"required" json:"birthday"`
	Email           string    `binding:"required" json:"email"`
	Phone           string    `json:"phone"`
	City            string    `binding:"required" json:"city"`
	Zip             string    `binding:"required" json:"zip"`
	Street          string    `binding:"required" json:"street"`
	Country         string    `binding:"required" json:"country"`
}

func (server *Server) createAccount(ctx *gin.Context) {
	var req createAccountRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	arg := db.CreateAccountTxParams{
		Passwordhash: req.Passwordhash,
		PrivacyAccepted: sql.NullBool{
			Valid: true,
			Bool:  req.PrivacyAccepted,
		},
		Firstname: req.Firstname,
		Lastname:  req.Lastname,
		Birthday:  req.Birthday,
		Email:     req.Email,
		City:      req.City,
		Zip:       req.Zip,
		Street:    req.Street,
		Country:   req.Country,
		Creator:   req.Email,
		Phone: sql.NullString{
			Valid:  req.Phone != "",
			String: req.Phone,
		},
	}

	account, err := server.store.CreateAccountTx(ctx, arg)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, account)
}

type getAccountRequest struct {
	ID int64 `uri:"id" binding:"required,min=1" json:"id"`
}

func (server *Server) getAccount(ctx *gin.Context) {
	var req getAccountRequest

	if err := ctx.ShouldBindUri(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	account, err := server.store.GetAccount(ctx, req.ID)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}

		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	authPayload := ctx.MustGet(authorizationPayloadKey).(*token.Payload)
	if account.Email != authPayload.Email {
		err := errors.New("account doesn't belong to the authenticated user")
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		return
	}
	//v4.public.eyJlbWFpbCI6ImFAYi5jZSIsImV4cCI6IjIwMjMtMTAtMDRUMDA6NDY6NDYrMDI6MDAiLCJpYXQiOiIyMDIzLTEwLTA0VDAwOjMxOjQ2KzAyOjAwIiwiaWQiOiJhZWU0MGE0NC0yMGIwLTQ3YmYtYmI5Yy04M2Y3ZmI5ZTU0MTEiLCJuYmYiOiIyMDIzLTEwLTA0VDAwOjMxOjQ2KzAyOjAwIn2ZcKWD7cA7y_aHnfUtYOnaR6iCYFaFOY5BbUQkyTpu-ZK9xyaHO1_j9GqAZ6GbntmtWktojWRBkLpoWEntMuQM
	ctx.JSON(http.StatusOK, account)
}

type listAccountRequest struct {
	PageID   int32 `form:"page_id" binding:"required,min=1"`
	PageSize int32 `form:"page_size" binding:"required,min=5,max=50"`
}

func (server *Server) listAccounts(ctx *gin.Context) {
	var req listAccountRequest

	if err := ctx.ShouldBindQuery(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	authPayload := ctx.MustGet(authorizationPayloadKey).(*token.Payload)
	slog.Error("auth", "payload", fmt.Sprintf("%#v", authPayload))

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}

		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	if account.PermissionLevel < 1 {
		err := errors.New("only for admin users")
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		return
	}

	arg := db.ListAccountsParams{
		Limit:  req.PageSize,
		Offset: (req.PageID - 1) * req.PageSize,
	}

	accounts, err := server.store.ListAccounts(ctx, arg)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, accounts)
}

type updateAccountPrivacyRequest struct {
	ID              int64 `binding:"required" json:"ID"`
	PrivacyAccepted *bool `binding:"required" json:"privacy_accepted"`
}

func (server *Server) updateAccountPrivacy(ctx *gin.Context) {
	var req updateAccountPrivacyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	account, err := server.store.GetAccount(ctx, req.ID)
	if err != nil {
		ctx.JSON(http.StatusNotFound, errorResponse(err))
		return
	}

	authPayload := ctx.MustGet(authorizationPayloadKey).(*token.Payload)
	if account.Email != authPayload.Email {
		err := errors.New("account doesn't belong to the authenticated user")
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		return
	}

	account, err = server.store.UpdateAccountPrivacyTx(ctx, db.UpdateAccountPrivacyTxParams{
		ID:              req.ID,
		Changer:         authPayload.Email,
		PrivacyAccepted: req.PrivacyAccepted,
	})
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, account)
}

type updateAccountRequest struct {
	ID          int64     `binding:"required" json:"ID"`
	NewPassword string    `json:"new_password"`
	Firstname   string    `json:"firstname"`
	Lastname    string    `json:"lastname"`
	Birthday    time.Time `json:"birthday"`
	Email       string    `json:"email"`
	Phone       string    `json:"phone"`
	City        string    `json:"city"`
	Zip         string    `json:"zip"`
	Street      string    `json:"street"`
	Country     string    `json:"country"`
}

func (server *Server) updateAccount(ctx *gin.Context) {
	var req updateAccountRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	account, err := server.store.GetAccount(ctx, req.ID)
	if err != nil {
		ctx.JSON(http.StatusNotFound, errorResponse(err))
		return
	}

	authPayload := ctx.MustGet(authorizationPayloadKey).(*token.Payload)
	if account.Email != authPayload.Email {
		err := errors.New("account doesn't belong to the authenticated user")
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		return
	}

	arg := db.UpdateAccountTxParams{
		ID:      req.ID,
		Changer: authPayload.Email,
		Passwordhash: sql.NullString{
			String: req.NewPassword,
			Valid:  req.NewPassword != "",
		},
		Firstname: sql.NullString{
			String: req.Firstname,
			Valid:  req.Firstname != "",
		},
		Lastname: sql.NullString{
			String: req.Lastname,
			Valid:  req.Lastname != "",
		},
		Birthday: sql.NullTime{
			Time:  req.Birthday,
			Valid: req.Birthday != time.Time{},
		},
		Email: sql.NullString{
			String: req.Email,
			Valid:  req.Email != "",
		},
		City: sql.NullString{
			String: req.City,
			Valid:  req.City != "",
		},
		Zip: sql.NullString{
			String: req.Zip,
			Valid:  req.Zip != "",
		},
		Street: sql.NullString{
			String: req.Street,
			Valid:  req.Street != "",
		},
		Country: sql.NullString{
			String: req.Country,
			Valid:  req.Country != "",
		},
		Phone: sql.NullString{
			String: req.Phone,
			Valid:  req.Phone != "",
		},
	}

	account, err = server.store.UpdateAccountTx(ctx, arg)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, account)
}
