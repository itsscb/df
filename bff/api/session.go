package api

import (
	"database/sql"
	"errors"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	db "github.com/itsscb/df/bff/db/sqlc"
	"github.com/itsscb/df/bff/token"
	"github.com/itsscb/df/bff/util"
)

type loginAccountRequest struct {
	Email    string `json:"email" binding:"required"`
	Password string `json:"password" binding:"required,min=6"`
}

type loginAccountResponse struct {
	SessionID             uuid.UUID `json:"session_id"`
	AccessToken           string    `json:"access_token"`
	AccessTokenExpiresAt  time.Time `json:"access_token_expires_at"`
	RefreshToken          string    `json:"refresh_token"`
	RefreshTokenExpiresAt time.Time `json:"refresh_token_expires_at"`
	AccountID             uint64    `json:"account_id"`
}

func (server *Server) loginAccount(ctx *gin.Context) {
	var req loginAccountRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	account, err := server.store.GetAccountByEmail(ctx, req.Email)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			ctx.JSON(http.StatusNotFound, errorResponse(err))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	err = util.CheckPassword(req.Password, account.Passwordhash)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, errorResponse(err))
		return
	}

	id, err := server.tokenMaker.NewTokenID()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("failed to create session token")))
	}
	refreshToken, refreshPayload, err := server.tokenMaker.CreateToken(
		account.ID,
		id,
		server.config.RefreshTokenDuration,
	)

	accessToken, accessPayload, err := server.tokenMaker.CreateToken(
		account.ID,
		id,
		server.config.AccessTokenDuration,
	)

	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	session, err := server.store.CreateSession(ctx, db.CreateSessionParams{
		ID:           refreshPayload.ID,
		AccountID:    refreshPayload.AccountID,
		RefreshToken: refreshToken,
		UserAgent:    ctx.Request.UserAgent(),
		ClientIp:     ctx.ClientIP(),
		IsBlocked:    false,
		ExpiresAt:    refreshPayload.ExpiredAt,
	})
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	rsp := loginAccountResponse{
		SessionID:             session.ID,
		AccessToken:           accessToken,
		AccessTokenExpiresAt:  accessPayload.ExpiredAt,
		RefreshToken:          refreshToken,
		RefreshTokenExpiresAt: refreshPayload.ExpiredAt,
		AccountID:             refreshPayload.AccountID,
	}
	ctx.JSON(http.StatusOK, rsp)
}

type blockSessionRequest struct {
	ID uuid.UUID `json:"session_id"`
}

func (server *Server) blockSession(ctx *gin.Context) {
	var req blockSessionRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(err))
		return
	}

	authorizationPayload, ok := ctx.Get(authorizationPayloadKey)
	if !ok {
		ctx.JSON(http.StatusUnauthorized, nil)
		return
	}

	payload := authorizationPayload.(*token.Payload)

	session, err := server.store.GetSession(ctx, req.ID)
	if err != nil {
		if errors.Is(err, sql.ErrNoRows) {
			ctx.JSON(http.StatusUnauthorized, errorResponse(errors.New("unauthorized")))
			return
		}
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	if session.IsBlocked {
		ctx.JSON(http.StatusAlreadyReported, errorResponse(errors.New("already blocked")))
		return
	}

	if session.AccountID != payload.AccountID {
		ctx.JSON(http.StatusUnauthorized, errorResponse(errors.New("unauthorized")))
		return
	}

	err = server.store.BlockSession(ctx, session.ID)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(err))
		return
	}

	rsp := struct {
		Ok bool
	}{
		Ok: true,
	}

	ctx.JSON(http.StatusOK, rsp)
}
