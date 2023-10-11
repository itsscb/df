package gw

import (
	"errors"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/gin-gonic/gin"
)

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

	account, err := server.store.GetAccountByEmail(ctx, authPayload.Email)
	if err != nil {
		ctx.JSON(http.StatusNotFound, errorResponse(errors.New("account not found")))
		return
	}

	file, err := ctx.FormFile("file")
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not parse file")))
		return
	}

	p := filepath.Join("./files", fmt.Sprintf("%d", account.ID), file.Filename)

	if _, err := os.Stat(p); err != nil {
		err = ctx.SaveUploadedFile(file, p)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not save file")))
			return

		}
	} else {
		ctx.JSON(http.StatusConflict, errorResponse(errors.New("filename already exists")))
		return
	}
}
