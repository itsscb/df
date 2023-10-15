package db

import (
	"context"
	"fmt"
	"os"
	"path/filepath"

	"google.golang.org/grpc/codes"
)

func (store *SQLStore) DeleteDocumentTx(ctx context.Context, id uint64) (code codes.Code, err error) {

	doc, err := store.GetDocument(ctx, id)
	if err != nil {
		return codes.NotFound, fmt.Errorf("document not found")
	}

	p := filepath.Join("./", doc.Path)

	_, err = os.Stat(p)
	if err != nil {
		return codes.Internal, fmt.Errorf("document not found on disk")
	}

	err = store.execTx(ctx, func(q *Queries) error {
		var err error

		err = q.DeleteDocument(ctx, id)
		if err != nil {
			return err
		}

		err = os.Remove(p)
		if err != nil {
			return fmt.Errorf("could not delete file from disk")
		}
		return err
	})

	if err != nil {
		return codes.Internal, err
	}

	return codes.OK, err
}
