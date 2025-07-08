all:
	docker compose -f srcs/docker-compose.yml --env-file srcs/.env up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean: down
	docker system prune -af --volumes

re: fclean all

