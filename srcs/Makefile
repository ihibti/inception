all: build
	docker compose up
down:
	docker compose down
	docker compose down -v

build: down
	docker compose build

purge:
	sudo rm -rf /home/ihibti/data/db/*