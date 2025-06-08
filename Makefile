all: build
	docker compose -f srcs/docker-compose.yml up
down:
	docker compose -f srcs/docker-compose.yml down
	docker compose -f srcs/docker-compose.yml down -v

build: down
	docker compose -f srcs/docker-compose.yml build

purge:down
	sudo rm -rf /home/ihibti/data/db/*
	sudo rm -rf /home/ihibti/data/wpvol/*
	
	docker system prune -af