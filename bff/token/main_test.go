package token

import (
	"os"
	"testing"

	"aidanwoods.dev/go-paseto"
)

var devPrivateKeyHex string

func TestMain(m *testing.M) {
	devPrivateKeyHex = paseto.NewV4AsymmetricSecretKey().ExportHex()

	os.Exit(m.Run())
}
