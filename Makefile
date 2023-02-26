

NAME		= inception

COMPOSE		= docker-compose -f srcs/docker-compose.yml -p $(NAME)


all:		up

up:			build
			$(COMPOSE) up --detach

build:		volumes
			$(COMPOSE) build --parallel

volumes:
			@mkdir -p /home/$(USER)/data/WordPress
			@mkdir -p /home/$(USER)/data/DB

create:		build
			$(COMPOSE) create


start:
			$(COMPOSE) start

restart:
			$(COMPOSE) restart

ps:
			$(COMPOSE) ps

exec:
ifeq '$(CONTAINER)' ''
	@echo "Usage: make exec CONTAINER=<CONTAINER_NAME>"
else
	$(COMPOSE) exec $(CONTAINER) /bin/bash
endif

stop:
			$(COMPOSE) stop

down:
			$(COMPOSE) down --rmi all

delete_volumes:
			docker volume rm $(shell docker volume ls -f "name=inception" -q)
			rm -rf /home/$(shell echo $USER)/data

logs:
			docker-compose -f srcs/docker-compose.yml -p inception logs

re:			fclean all

.PHONY:		all re up down build create ps exec start restart stop clean fclean
