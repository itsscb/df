package api

import (
	"os"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/itsscb/df/util"
)

var config util.Config

func TestMain(m *testing.M) {
	config = util.Config{
		Environment: "production",
	}

	gin.SetMode(gin.TestMode)

	os.Exit(m.Run())
}
