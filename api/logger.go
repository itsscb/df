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

		// var buf bytes.Buffer
		// tee := io.TeeReader(c.Request.Body, &buf)
		// body, _ := io.ReadAll(tee)
		// c.Request.Body = io.NopCloser(&buf)
		c.Next()
		duration := time.Since(t).Milliseconds()

		log := []slog.Attr{
			slog.String("METHOD", c.Request.Method),
			slog.String("PATH", c.Request.RequestURI),
			slog.String("DURATION", fmt.Sprintf("%d ms", duration)),
			// slog.String("BODY", string(body)),
		}

		logger.LogAttrs(
			c,
			slog.LevelDebug,
			"http",
			log...,
		)
	}
}
