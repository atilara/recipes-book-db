all: down build up

build:
	@docker compose build

up:
	@docker compose up -d

down:
	@docker compose down

mongo:
	@docker compose exec -it mongodb mongosh "mongodb://root:root@localhost:27017"
	