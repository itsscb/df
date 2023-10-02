package api

import (
	"os"
	"testing"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/itsscb/df/bff/util"
)

var config util.Config

func TestMain(m *testing.M) {
	config = util.Config{
		Environment:          "production",
		TokenPrivateKeyHex:   "099c0b96725b99e95719c92aec580809ac58fc14be2105ed2656f1f6c464593d8cacd6c7bed924b9cf207ab3cff1c59be4e5865260c4dafa29699244bd4ea2de",
		AccessTokenDuration:  time.Minute * 1,
		RefreshTokenDuration: time.Minute * 2,
	}

	gin.SetMode(gin.TestMode)

	os.Exit(m.Run())
}
