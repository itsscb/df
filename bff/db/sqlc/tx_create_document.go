package db

import (
	"context"
	"crypto/sha256"
	"database/sql"
	"encoding/hex"
	"errors"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
	"os"
	"path"
	"path/filepath"
)

type CreateDocumentTxParams struct {
	AccountID uint64                `json:"account_id"`
	PersonID  uint64                `json:"person_id"`
	MailID    uint64                `json:"mail_id"`
	File      *multipart.FileHeader `json:"file"`
	Creator   string                `json:"creator"`
}

type CreateDocumentTxResult struct {
	Document Document `json:"document"`
}

func (store *SQLStore) CreateDocumentTx(ctx context.Context, arg CreateDocumentTxParams) (doc Document, code int, err error) {
	var result CreateDocumentTxResult

	if arg.MailID > 0 && arg.PersonID > 0 {
		return Document{}, http.StatusBadRequest, errors.New("document can't be assigned to both person_id AND mail_id")
	}
	if arg.MailID < 1 && arg.PersonID < 1 {
		return Document{}, http.StatusBadRequest, errors.New("document has to be assigned to either a person_id or a mail_id")
	}

	req := CreateDocumentParams{
		Creator: arg.Creator,
	}
	targetDir := filepath.Join("./files", fmt.Sprintf("%d", arg.AccountID))

	fileData, err := arg.File.Open()
	if err != nil {
		return Document{}, http.StatusBadRequest, errors.New("failed to read file")
	}

	h := sha256.New()
	_, err = io.Copy(h, fileData)
	if err != nil {
		return Document{}, http.StatusInternalServerError, errors.New("could not create file hash")
	}

	fileData.Seek(0, io.SeekStart)

	req.Hash = hex.EncodeToString(h.Sum(nil))

	if arg.MailID > 0 {
		_, err := store.GetMail(ctx, arg.MailID)
		if err != nil {
			return Document{}, http.StatusNotFound, errors.New("mail not found")
		}

		targetDir = filepath.Join(targetDir, "mail", fmt.Sprintf("%d", arg.MailID))

		req.MailID = sql.NullInt64{
			Valid: true,
			Int64: int64(arg.MailID),
		}
	}

	if arg.PersonID > 0 {
		_, err := store.GetPerson(ctx, arg.PersonID)
		if err != nil {
			return Document{}, http.StatusNotFound, errors.New("person not found")
		}

		docs, err := store.GetDocumentByHash(ctx, GetDocumentByHashParams{
			AccountID: arg.AccountID,
			Hash:      req.Hash,
		})
		if err != nil {
			return Document{}, http.StatusInternalServerError, fmt.Errorf("could not check file hash in db: %v", err.Error())
		}

		if len(docs) > 0 {
			return Document{
				ID: docs[0],
			}, http.StatusConflict, errors.New("file already exists in database")
		}

		targetDir = filepath.Join(targetDir, "person", fmt.Sprintf("%d", arg.PersonID))
		req.PersonID = sql.NullInt64{
			Valid: true,
			Int64: int64(arg.PersonID),
		}
	}

	req.Type = path.Ext(arg.File.Filename)
	req.Name = arg.File.Filename

	p := filepath.Join(targetDir, req.Hash+path.Ext(arg.File.Filename))
	req.Path = p

	if _, err := os.Stat(p); err == nil {
		return Document{}, http.StatusConflict, errors.New("file already exists")
	}

	err = store.execTx(ctx, func(q *Queries) error {
		var err error

		if _, err := os.Stat(targetDir); err != nil {
			err = os.MkdirAll(targetDir, 0755)
			if err != nil {
				return errors.New("could not create directory structure")
			}

		}
		f, err := os.Create(p)
		if err != nil {
			return fmt.Errorf("could not create file: %v", err)
		}

		_, err = io.Copy(f, fileData)
		if err != nil {
			return errors.New("could not write file")
		}

		result.Document, err = q.CreateDocument(ctx, req)
		if err != nil {
			return err
		}
		return err
	})

	return result.Document, http.StatusInternalServerError, err
}
