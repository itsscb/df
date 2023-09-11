DB_URL=postgresql://root:secret@localhost:5432/df?sslmode=disable

network:
	podman network create df-network

postgres:
	podman run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

migratenew:
	migrate create -ext sql -dir db/migration -seq init_schema

migrateup:
	migrate -path db/migration -database $(DB_URL) -verbose up

migratedown:
	migrate -path db/migration -database $(DB_URL) -verbose down

createdb:
	podman exec -it postgres createdb --username=root --owner=root df

dropdb:
	podman exec -it postgres dropdb df

sqlc:
	sqlc generate

.PHONY: postgres migratenew createdb dropdb migrateup migratedown sqlc