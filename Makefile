up:
	docker compose -f "./srcs/docker-compose.yml" up --build -d
down:
	docker compose -f "./srcs/docker-compose.yml" down
clean: down
	sudo rm -rf ~/data/wordpress/*	
	sudo rm -rf ~/data/mariadb/*
	docker system prune -a -f
