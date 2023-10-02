package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	"github.com/itsscb/df/bff/util"
	_ "github.com/lib/pq"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	config, err := util.LoadConfig("../..")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatalf("could not connect to DB: %s", err)
	}

	testQueries = New(conn)

	os.Exit(m.Run())
}
