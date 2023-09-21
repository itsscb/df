package api

import (
	"database/sql"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/db/sqlc"
)

type createAccountRequest struct {
	Passwordhash string    `binding:"required" json:"passwordhash"`
	Firstname    string    `binding:"required" json:"firstname"`
	Lastname     string    `binding:"required" json:"lastname"`
	Birthday     time.Time `binding:"required" json:"birthday"`
	Email        string    `binding:"required" json:"email"`
	Phone        string    `json:"phone"`
	City         string    `binding:"required" json:"city"`
	Zip          string    `binding:"required" json:"zip"`
	Street       string    `binding:"required" json:"street"`
	Country      string    `binding:"required" json:"country"`
}

func (server *Server) createAccount(ctx *gin.Context) {
	var req createAccountRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	arg := db.CreateAccountParams{
		Passwordhash: req.Passwordhash,
		Firstname:    req.Firstname,
		Lastname:     req.Lastname,
		Birthday:     req.Birthday,
		Email:        req.Email,
		City:         req.City,
		Zip:          req.Zip,
		Street:       req.Street,
		Country:      req.Country,
		Creator:      "system",
		Phone: sql.NullString{
			Valid:  req.Phone != "",
			String: req.Phone,
		},
	}

	account, err := server.store.CreateAccount(ctx, arg)
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

		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, account)
}

type listAccountRequest struct {
	PageID   int32 `form:"pageid" binding:"required,min=1"`
	PageSize int32 `form:"pagesize" binding:"required,min=5,max=50"`
}

func (server *Server) listAccounts(ctx *gin.Context) {
	var req listAccountRequest

	if err := ctx.ShouldBindQuery(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	arg := db.ListAccountsParams{
		Limit:  req.PageSize,
		Offset: (req.PageID - 1) * req.PageSize,
	}

	accounts, err := server.store.ListAccounts(ctx, arg)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, accounts)
}
