all: build
	docker compose up
down:
	docker compose down
	docker compose down -v

build: down
	docker compose build

purge:down
	sudo rm -rf /home/ihibti/data/db/*
	docker system prune -af