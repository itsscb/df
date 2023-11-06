DB_URL=postgresql://root:secret@localhost:5432/df?sslmode=disable

reset_docker:
	-docker rm -vf df
	-docker rmi -f df
	-docker rm -vf postgres
	-docker rmi -f postgres
	-docker rm -vf migrate

backend_build:
	make network;
	make postgres;
	-docker rm -vf df;
	-docker rmi -f df:latest;
	-docker rmi -f docker.io/library/golang:1.21-alpine3.18
	docker build -t df:latest -f bff/Dockerfile
	docker exec -it postgres createdb --username=root --owner=root df
	docker run --name migrateup --rm --privileged=true -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ -database $(DB_URL) up

rebuild:
	-docker stop df-bff_api_1
	-docker stop df-bff_postgres_1
	-docker rm df-bff_api_1
	-docker rmi df-bff_api
	make backend

backend:
	docker-compose -f ./bff/docker-compose.yaml -p df-bff up -d

stop-backend:
	docker-compose -f ./bff/docker-compose.yaml -p df-bff down

dev:
	make network
	make postgres
	make createdb
	make migrateup

network:
	-docker network create df-network

postgres:
	docker start df-bff_postgres_1 || docker run --name df-bff_postgres_1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret --network df-network -d postgres:15-alpine

migratenew:
	docker run --name migratenew --privileged=true --rm -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ create -ext sql -dir migrations -seq $(name)

migrateup:
	docker run --name migrateup --privileged=true --rm -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ -database $(DB_URL) up

migratedown:
	docker run --name migratedown --privileged=true --rm -v $(PWD)/bff/db/migration:/migrations --network host migrate/migrate -path=/migrations/ -database $(DB_URL) down

createdb:
	docker exec -it df-bff_postgres_1 createdb --username=root --owner=root df

dropdb:
	docker exec -it df-bff_postgres_1 dropdb df

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

proto_app:
	cd frontend/app && \
	rm -f lib/pb/*.dart && \
	protoc --dart_out=grpc:lib/pb -I=../../bff/proto/ ../../bff/proto/*.proto && \
	cd ../..

evans:
	evans --host localhost --port 9090 --package pb -r repl

count_lines:
	cloc --exclude-dir=.history,.git,.idea,.dart_tool,build,ios,android,linux,macos,web,windows .

.PHONY: reset_docker backend_build rebuild backend backend dev network postgres migratenew migrateup migratedown createdb dropdb sqlc sqlcinit test coverage server mock proto evans count_lines