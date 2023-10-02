package api

import (
	"bytes"
	"fmt"
	"io"
	"log/slog"
	"time"

	"github.com/gin-gonic/gin"
)

type responseBodyWriter struct {
	gin.ResponseWriter
	body *bytes.Buffer
}

func (r responseBodyWriter) Write(b []byte) (int, error) {
	r.body.Write(b)
	return r.ResponseWriter.Write(b)
}

func Logger() gin.HandlerFunc {
	return func(c *gin.Context) {
		t := time.Now()

		var body []byte
		var w *responseBodyWriter

		if c.Request.Method != "GET" {
			body, _ = io.ReadAll(c.Request.Body)
			w = &responseBodyWriter{body: &bytes.Buffer{}, ResponseWriter: c.Writer}
			c.Writer = w
			c.Request.Body = io.NopCloser(bytes.NewReader(body))
		}
		c.Next()

		duration := time.Since(t).Milliseconds()

		if c.Request.Method != "GET" {
			slog.LogAttrs(
				c,
				slog.LevelDebug,
				"http",
				slog.Group(
					"request",
					slog.Int("STATUS", c.Writer.Status()),
					slog.String("METHOD", c.Request.Method),
					slog.String("PATH", c.Request.RequestURI),
					slog.String("DURATION", fmt.Sprintf("%d ms", duration)),
					slog.String("BODY", string(body)),
				),
				slog.Group(
					"response",
					slog.String("BODY", w.body.String()),
				),
			)
		} else {
			slog.LogAttrs(
				c,
				slog.LevelDebug,
				"http",
				slog.Group(
					"request",
					slog.Int("STATUS", c.Writer.Status()),
					slog.String("METHOD", c.Request.Method),
					slog.String("PATH", c.Request.RequestURI),
					slog.String("DURATION", fmt.Sprintf("%d ms", duration)),
				),
			)

		}
	}
}
