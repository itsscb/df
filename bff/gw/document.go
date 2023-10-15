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

// type uploadDocumentRequest struct {
// 	PersonID uint64 `json:"person_id"`
// 	MailID   uint64 `json:"mail_id"`
// }

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

	// TODO: FileUpload with POST-Values
	// bodyData, _ := io.ReadAll(ctx.Request.Body)
	// slog.Info("Document", slog.String("body", fmt.Sprintf("%#v", string(bodyData))))

	file, err := ctx.FormFile("file")
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not parse file")))
		return
	}

	targetDir := filepath.Join("./files", fmt.Sprintf("%d", account.ID))

	// var req *uploadDocumentRequest
	// _ = ctx.ShouldBindJSON(&req)

	// if req != nil {
	// 	if req.MailID <= 0 && req.PersonID <= 0 {
	// 		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("document can't be assigned to both person_id AND mail_id")))
	// 		return
	// 	}

	// 	if req.MailID > 0 {
	// 		targetDir = filepath.Join(targetDir, "mail", fmt.Sprintf("%d", req.MailID))
	// 	}
	// 	if req.PersonID > 0 {
	// 		targetDir = filepath.Join(targetDir, "person", fmt.Sprintf("%d", req.PersonID))
	// 	}
	// }

	p := filepath.Join(targetDir, file.Filename)

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
