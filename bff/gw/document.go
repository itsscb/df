package gw

import (
	"errors"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
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

	file, err := ctx.FormFile("file")
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not parse file")))
		return
	}

	targetDir := filepath.Join("./files", fmt.Sprintf("%d", account.ID))

	var req *uploadDocumentRequest
	err = ctx.ShouldBind(&req)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to parse request")))
		return
	}

	fileData, err := file.Open()
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to read file")))
		return
	}

	if req != nil {
		if req.MailID <= 0 && req.PersonID <= 0 {
			ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("document can't be assigned to both person_id AND mail_id")))
			return
		}

		if req.MailID > 0 {
			_, err := server.store.GetMail(ctx, req.MailID)
			if err != nil {
				ctx.JSON(http.StatusNotFound, errorResponse(errors.New("mail not found")))
				return

			}
			targetDir = filepath.Join(targetDir, "mail", fmt.Sprintf("%d", req.MailID))
		}
		if req.PersonID > 0 {
			_, err := server.store.GetPerson(ctx, req.PersonID)
			if err != nil {
				ctx.JSON(http.StatusNotFound, errorResponse(errors.New("person not found")))
				return

			}
			targetDir = filepath.Join(targetDir, "person", fmt.Sprintf("%d", req.PersonID))
		}
	}

	uid, err := uuid.NewUUID()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not generate file name")))
		return
	}

	if _, err := os.Stat(targetDir); err != nil {
		err = os.MkdirAll(targetDir, 0755)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not create directory structure")))
			return
		}

	}

	p := filepath.Join(targetDir, uid.String()+path.Ext(file.Filename))

	if _, err := os.Stat(p); err != nil {
		f, err := os.Create(p)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, errorResponse(fmt.Errorf("could not create file: %v", err)))
			return
		}

		_, err = io.Copy(f, fileData)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not write file")))
			return
		}
		// err = ctx.SaveUploadedFile(file, p)
		// if err != nil {
		// 	ctx.JSON(http.StatusInternalServerError, errorResponse(errors.New("could not save file")))
		// 	return
		// }
	} else {
		ctx.JSON(http.StatusConflict, errorResponse(errors.New("filename already exists")))
		return
	}
}
