

NAME		= inception

COMPOSE		= docker-compose -f srcs/docker-compose.yml -p $(NAME)

# ************************************************************************** #
#                                                                            #
#                              ~~~ RULES & COMMANDS ~~~                      #
#                                                                            #
# ************************************************************************** #

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
			$(COMPOSE) ps --all

exec:
ifeq '$(CONTAINER)' ''
	@echo "Usage: make exec CONTAINER=<CONTAINER_NAME>"
else
	$(COMPOSE) exec $(CONTAINER) /bin/bash
endif

stop:
			$(COMPOSE) stop

down:
			$(COMPOSE) down

clean:
			docker-compose --project-directory=srcs down --rmi all

fclean:
			docker-compose --project-directory=srcs down --rmi all --volumes
			sudo rm -rf /home/$(USER)/data/*

re:			fclean all

.PHONY:		all re up down build create ps exec start restart stop clean fclean
