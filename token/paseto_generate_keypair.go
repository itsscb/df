package token

import (
	"log"
	"os"

	"aidanwoods.dev/go-paseto"
)

const (
	devPrivateKeyFile = "development_privatekey.asc"
)

func GenerateKeyPair() (err error) {
	secretKey := paseto.NewV4AsymmetricSecretKey()

	if err = os.WriteFile(devPrivateKeyFile, []byte(secretKey.ExportHex()), 0666); err != nil {
		log.Fatalf("could not create development_privatekey.asc: %v", err)
		return err
	}

	return err
}

func GetPrivateKey() (paseto.V4AsymmetricSecretKey, error) {
	f, err := os.ReadFile(devPrivateKeyFile)
	if err != nil {
		return paseto.V4AsymmetricSecretKey{}, err
	}

	return paseto.NewV4AsymmetricSecretKeyFromHex(string(f))
}
