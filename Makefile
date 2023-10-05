DB_URL=postgresql://root:secret@localhost:5432/df?sslmode=disable

reset_docker:
	docker rm -vf df
	docker rmi -f df
	docker rm -vf postgres
	docker rmi -f postgres
	docker rm -vf migrate

backend_build:
	make network; \
	make postgres; \
	docker rm -vf df; \
	docker rmi -f df:latest; \
	docker rmi -f docker.io/library/golang:1.21-alpine3.18; \
	docker build -t df:latest -f bff/Dockerfile; \
	docker exec -it postgres createdb --username=root --owner=root df; \
	docker run --name migrateup --rm --privileged=true -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ -database $(DB_URL) up

backend:
	docker start postgres; docker rm -vf df; docker run --name df --rm -p 8080:8080 --network df-network -d df:latest

backend-stop:
	docker stop postgres; docker stop df

network:
	docker network create df-network

postgres:
	docker start postgres || docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret --network df-network -d postgres:15-alpine

migratenew:
	docker run --name migratenew --privileged=true --rm -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ create -ext sql -dir migrations -seq $(name)

migrateup:
	docker run --name migrateup --privileged=true --rm -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ -database $(DB_URL) up

migratedown:
	docker run --name migratedown --privileged=true --rm -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ -database $(DB_URL) down

createdb:
	docker exec -it postgres createdb --username=root --owner=root df

dropdb:
	docker exec -it postgres dropdb df

sqlc:
	cd bff && \
	sqlc generate && \
	cd ..

sqlcinit:
	cd bff && \
	sqlc init

test:
	cd bff && \
	go test -v -cover -short -count=1 ./... \
	&& cd ..

coverage:
	cd bff && \
	go test -coverprofile=coverage.out ./... && \
	go tool cover -html=coverage.out && \
	cd ..

server:
	cd bff && \
	go run main.go && \
	cd ..

mock:
	cd bff && mockgen -package mockdb -destination db/mock/store.go github.com/itsscb/df/bff/db/sqlc Store && cd ..

proto:
	cd bff && \
	rm -f doc/swagger/*.swagger.json && \
	rm -f pb/*.go && \
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
	--go-grpc_out=pb --go-grpc_opt=paths=source_relative \
	--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=df \
	--grpc-gateway_out=pb --grpc-gateway_opt=paths=source_relative \
	./proto/*.proto
	cd ..

evans:
	evans --host localhost --port 9090 --package pb -r repl

.PHONY: postgres migratenew createdb dropdb migrateup migratedown sqlc sqlcinit test server backend_build backend backend-stop reset_docker proto evans
