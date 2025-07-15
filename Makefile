NAME = inception
COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	@echo "Building Docker images..."
	docker compose -f $(COMPOSE_FILE) build

up:
	@echo "Starting services..."
	docker compose -f $(COMPOSE_FILE) up -d

down:
	@echo "Stopping services..."
	docker compose -f $(COMPOSE_FILE) down

clean: down
	@echo "Cleaning up containers..."
	docker system prune -f

fclean: clean
	@echo "Full cleanup..."
	docker compose -f $(COMPOSE_FILE) down -v
	docker system prune -af
	docker volume prune -f

re: fclean all

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

status:
	docker compose -f $(COMPOSE_FILE) ps

.PHONY: all build up down clean fclean re logs status