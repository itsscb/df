# Build stage
FROM golang:1.21-alpine3.18 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

# Run stage
FROM alpine:3.18
WORKDIR /app
RUN mkdir files
COPY --from=builder /app/main .
COPY app.env .
ENV DB_SOURCE=postgresql://root:secret@postgres:5432/df?sslmode=disable
COPY db/migration ./db/migration

EXPOSE 8080
CMD [ "/app/main" ]