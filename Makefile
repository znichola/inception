
D=srcs/docker-compose.yml
ENV=srcs/.env
CONTAINERS = $(shell docker ps -a -q)
TIDY=2>/dev/null ; true

up : FORCE $(ENV) print-env
	docker compose -f $D -p inception up

down :
	docker compose -p inception down

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

ls :
	docker container ls
	docker image     ls
	docker network   ls
	docker volume    ls

re : fclean up

data-clean :
	rm -rf /home/znichola/data
	mkdir -p /home/znichola/data/mariadb
	mkdir -p /home/znichola/data/wordpress
	rm srcs/.env                                     $(TIDY)

print-env :
	./srcs/requirements/tools/print_password.sh srcs/.env

ip :
	docker ps -q | xargs -I{} docker inspect -f '{{.Name}} {{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' {}

CN = nginx mariadb wordpress ftp_server adminer redis

$(CN) :
	docker exec -it $@ /bin/bash

$(ENV) :
	@./srcs/requirements/tools/gen-env.sh
	@mv .env $@

FORCE :

.PHONY: clean up down
