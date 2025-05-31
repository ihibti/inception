all: build
	docker compose up
down:
	docker compose down
	docker compose down -v

build: down
	docker compose build