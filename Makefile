# no idea what this does, yet
CONTAINERS = $(shell docker ps -a -q)

clean :
	docker stop $(CONTAINERS)
	docker rm   $(CONTAINERS)
