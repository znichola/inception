
D=srcs/docker-compose.yml
ENV=srcs/.env
CONTAINERS = $(shell docker ps -a -q)
TIDY=2>/dev/null ; true

up : FORCE $(ENV) 
	docker compose -f $D up -d

down :
	docker compose -f $D down

clean : down
	yes | docker container prune
	yes | docker image     prune
	yes | docker network   prune

fclean : down clean
	docker stop       $(CONTAINERS)                  $(TIDY)
	docker rm         $(CONTAINERS)                  $(TIDY)
	docker network rm $(shell docker network ls -q)  $(TIDY)
	rm srcs/.env                                     $(TIDY)

$(ENV) :
	@./srcs/requirements/tools/gen-env.sh
	@mv .env $@

FORCE :

.PHONY: clean up down
