package api

import (
	"os"
	"testing"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/itsscb/df/util"
)

var config util.Config

func TestMain(m *testing.M) {
	config = util.Config{
		Environment:          "production",
		TokenSymmetricKey:    "12345678901234567890123456789012",
		AccessTokenDuration:  time.Minute * 1,
		RefreshTokenDuration: time.Minute * 2,
	}

	gin.SetMode(gin.TestMode)

	os.Exit(m.Run())
}
