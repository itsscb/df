package gw

import (
	"errors"
	"mime/multipart"
	"net/http"
	"strings"

	"log/slog"

	"github.com/gin-gonic/gin"
	db "github.com/itsscb/df/bff/db/sqlc"
)

type uploadDocumentRequest struct {
	PersonID uint64                `form:"person_id"`
	MailID   uint64                `form:"mail_id"`
	File     *multipart.FileHeader `form:"file"`
}

func (server *Server) UploadDocument(ctx *gin.Context) {
	authHeader := ctx.GetHeader("authorization")

	authFields := strings.Fields(authHeader)

	if len(authFields) != 2 {
		ctx.JSON(http.StatusUnauthorized, errorResponse(errors.New("invalid or missing authorization header")))
		return
	}

	token := authFields[1]

	authPayload, err := server.tokenMaker.VerifyToken(token)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, errorResponse(errors.New("invalid authorization header")))
		return
	}

	account, err := server.store.GetAccount(ctx, authPayload.AccountID)
	if err != nil {
		ctx.JSON(http.StatusNotFound, errorResponse(errors.New("account not found")))
		return
	}

	var req *uploadDocumentRequest
	err = ctx.ShouldBind(&req)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to parse request")))
		return
	}

	r := db.CreateDocumentTxParams{
		AccountID: account.ID,
		PersonID:  req.PersonID,
		MailID:    req.MailID,
		File:      req.File,
		Creator:   account.Email,
	}

	doc, code, err := server.store.CreateDocumentTx(ctx, r)
	if err != nil {
		if code == http.StatusInternalServerError {
			slog.Error("create_document", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.String("document_name", req.File.Filename), slog.String("error", err.Error()))
		}
		ctx.JSON(code, errorResponse(err))
		return
	}

	ctx.JSON(http.StatusOK, doc)
}
