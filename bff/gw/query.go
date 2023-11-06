package gw

import (
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

func (server *Server) Query(ctx *gin.Context) {
	// authHeader := ctx.GetHeader("authorization")

	// authFields := strings.Fields(authHeader)

	// if len(authFields) != 2 {
	// 	ctx.JSON(http.StatusUnauthorized, errorResponse(errors.New("invalid or missing authorization header")))
	// 	return
	// }

	// token := authFields[1]

	// authPayload, err := server.tokenMaker.VerifyToken(token)
	// if err != nil {
	// 	ctx.JSON(http.StatusUnauthorized, errorResponse(errors.New("invalid authorization header")))
	// 	return
	// }

	// account, err := server.store.GetAccount(ctx, authPayload.AccountID)
	// if err != nil {
	// 	ctx.JSON(http.StatusNotFound, errorResponse(errors.New("account not found")))
	// 	return
	// }

	var jsonData map[string]interface{}
	data, err := io.ReadAll(ctx.Request.Body)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to parse request body")))
		return
	}

	fmt.Println(string(data))

	if err = json.Unmarshal(data, &jsonData); err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to unmarshal request body json")))
		return
	}

	name, ok := jsonData["name"]
	if !ok {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("required query name is missing")))
		return
	}

	q, err := server.store.GetQueryByName(ctx, fmt.Sprintf("%s", name))
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to get query")))
		return
	}

	res, err := server.store.Query(ctx, q.Query)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, errorResponse(fmt.Errorf("failed to run query: %v", err)))
		return
	}

	ctx.JSON(http.StatusOK, res)
	return

	// var req *uploadDocumentRequest
	// err = ctx.ShouldBind(&req)
	// if err != nil {
	// 	ctx.JSON(http.StatusBadRequest, errorResponse(errors.New("failed to parse request")))
	// 	return
	// }

	// r := db.CreateDocumentTxParams{
	// 	AccountID: account.ID,
	// 	PersonID:  req.PersonID,
	// 	MailID:    req.MailID,
	// 	File:      req.File,
	// 	Creator:   account.Email,
	// }

	// doc, code, err := server.store.CreateDocumentTx(ctx, r)
	// if err != nil {
	// 	if code == http.StatusInternalServerError {
	// 		slog.Error("create_document", slog.Int64("invoked_by", int64(authPayload.AccountID)), slog.String("document_name", req.File.Filename), slog.String("error", err.Error()))
	// 	}
	// 	ctx.JSON(code, errorResponse(err))
	// 	return
	// }

	// ctx.JSON(http.StatusOK, doc)
}

func clearStatement(statement string) string {
	statement = strings.ReplaceAll(statement, ";", "")
	statement = strings.ReplaceAll(statement, "'", "")
	statement = strings.ReplaceAll(statement, "\"", "")
	statement = strings.ReplaceAll(statement, "`", "")
	statement = strings.ReplaceAll(statement, "DROP", "")
	statement = strings.ReplaceAll(statement, "DELETE", "")

	return statement
}
