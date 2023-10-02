DB_URL=postgresql://root:secret@localhost:5432/df?sslmode=disable


initialize:
	go mod tidy && docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine && sleep 5 && make network && make createdb && make migrateup && make test

network:
	docker network create df-network

postgres:
	docker start postgres || docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

migratenew:
	migrate create -ext sql -dir db/bff/migration -seq init_schema

migrateup:
	migrate -path db/bff/migration -database $(DB_URL) -verbose up

migratedown:
	migrate -path db/bff/migration -database $(DB_URL) -verbose down

createdb:
	docker exec -it postgres createdb --username=root --owner=root df

dropdb:
	docker exec -it postgres dropdb df

sqlc:
	sqlc generate

sqlcinit:
	sqlc init

test:
	cd bff && go test -v -cover -short -count=1 ./... && cd ..

coverage:
	cd bff && go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out && cd ..

server:
	cd bff && go run main.go && cd ..

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/itsscb/df/bff/db/sqlc Store

.PHONY: postgres migratenew createdb dropdb migrateup migratedown sqlc sqlcinit test server, initialize
