DB_URL=postgresql://root:secret@localhost:5432/df?sslmode=disable

ifeq ($(shell command -v podman 2> /dev/null),)
    CMD=docker
else
    CMD=podman
endif

network:
	$(CMD) network create df-network

postgres:
	$(CMD) start postgres || $(CMD) run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

migratenew:
	migrate create -ext sql -dir db/migration -seq init_schema

migrateup:
	migrate -path db/migration -database $(DB_URL) -verbose up

migratedown:
	migrate -path db/migration -database $(DB_URL) -verbose down

createdb:
	$(CMD) exec -it postgres createdb --username=root --owner=root df

dropdb:
	$(CMD) exec -it postgres dropdb df

sqlc:
	sqlc generate

sqlcinit:
	sqlc init

test:
	go test -v -cover -short -count=1 ./...

coverage:
	go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out

server:
	go run main.go

.PHONY: postgres migratenew createdb dropdb migrateup migratedown sqlc sqlcinit test server
