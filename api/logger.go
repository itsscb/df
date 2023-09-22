package api

import (
	"fmt"
	"log/slog"
	"time"

	"github.com/gin-gonic/gin"
)

func Logger(logger *slog.Logger) gin.HandlerFunc {
	return func(c *gin.Context) {
		t := time.Now()
		var log []slog.Attr

		c.Next()

		duration := time.Since(t).Milliseconds()

		log = append(log,
			slog.Int("STATUS", c.Writer.Status()),
			slog.String("METHOD", c.Request.Method),
			slog.String("PATH", c.Request.RequestURI),
			slog.String("DURATION", fmt.Sprintf("%d ms", duration)),
		)

		logger.LogAttrs(
			c,
			slog.LevelDebug,
			"http",
			log...,
		)
	}
}
