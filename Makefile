
D=srcs/docker-compose.yml
ENV=srcs/.env
CONTAINERS = $(shell docker ps -a -q)
TIDY=2>/dev/null ; true

up : FORCE $(ENV) 
	docker compose -f $D -p inception up -d

down :
	docker compose -f $D down

clean : down
	yes | docker container prune
	yes | docker image     prune
	yes | docker network   prune
	yes | docker volume    prune

fclean : 
	docker stop       $(CONTAINERS)                  $(TIDY)
	docker rm         $(CONTAINERS)                  $(TIDY)
	docker network rm $(shell docker network ls -q)  $(TIDY)
	docker image rm   $(shell docker image ls -q)    $(TIDY)
	docker volume rm  $(shell docker volume ls -q)   $(TIDY)
	rm srcs/.env                                     $(TIDY)
#	rm -rf /home/znichola/data
#	mkdir /home/znichola/mariadb
#	mkdir /home/znichola/wordpress

ls :
	docker container ls
	docker image     ls
	docker network   ls
	docker volume    ls

re : fclean up

CN = nginx mariadb wordpress

$(CN) :
	docker exec -it $@ /bin/bash

$(ENV) :
	@./srcs/requirements/tools/gen-env.sh
	@mv .env $@

FORCE :

.PHONY: clean up down
