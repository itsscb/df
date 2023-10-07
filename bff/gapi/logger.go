package gapi

import (
	"context"
	"log/slog"
	"net/http"
	"time"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func GrpcLogger(
	ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler,
) (resp interface{}, err error) {
	startTime := time.Now()
	result, err := handler(ctx, req)
	duration := time.Since(startTime)

	statusCode := codes.Unknown
	if st, ok := status.FromError(err); ok {
		statusCode = st.Code()
	}

	if err != nil {
		slog.Error("received a gRPC request",
			slog.String("protocol", "grpc"),
			slog.String("endpoint", info.FullMethod),
			slog.Int("status_code", int(statusCode)),
			slog.String("status_text", statusCode.String()),
			slog.Duration("duration", duration),
			slog.String("error", err.Error()),
		)
	} else {
		slog.Info("received a gRPC request",
			slog.String("protocol", "grpc"),
			slog.String("endpoint", info.FullMethod),
			slog.Int("status_code", int(statusCode)),
			slog.String("status_text", statusCode.String()),
			slog.Duration("duration", duration),
		)
	}

	return result, err
}

type ResponseRecorder struct {
	http.ResponseWriter
	StatusCode int
	Body       []byte
}

func (rec *ResponseRecorder) WriteHeader(statusCode int) {
	rec.StatusCode = statusCode
	rec.ResponseWriter.WriteHeader(statusCode)
}

func (rec *ResponseRecorder) Write(body []byte) (int, error) {
	rec.Body = body
	return rec.ResponseWriter.Write(body)
}

func HttpLogger(handler http.Handler) http.Handler {
	return http.HandlerFunc(func(res http.ResponseWriter, req *http.Request) {
		startTime := time.Now()
		rec := &ResponseRecorder{
			ResponseWriter: res,
			StatusCode:     http.StatusOK,
		}

		handler.ServeHTTP(rec, req)
		duration := time.Since(startTime)

		if rec.StatusCode != http.StatusOK {
			slog.Error("received a HTTP request",
				slog.String("protocol", "http"),
				slog.String("method", req.Method),
				slog.String("endpoint", req.RequestURI),
				slog.Int("status_code", rec.StatusCode),
				slog.String("status_text", http.StatusText(rec.StatusCode)),
				slog.Duration("duration", duration),
				slog.String("body", string(rec.Body)),
			)
		} else {
			slog.Info("received a HTTP request",
				slog.String("protocol", "http"),
				slog.String("method", req.Method),
				slog.String("endpoint", req.RequestURI),
				slog.Int("status_code", rec.StatusCode),
				slog.String("status_text", http.StatusText(rec.StatusCode)),
				slog.Duration("duration", duration),
			)
		}
	})
}
