

# if the docker command is not found, in bash use zsh
# build a docker image
.PHONY: build
build:
	docker build -t python-docker .

# see the docker images
.PHONY: images
images:
	docker images

# tag the image
.PHONY: tag
tag:
	docker tag python-docker:latest python-docker:v1.0.0

# remove the image with tag v1.0.0
.PHONY: remove
remove:
	docker rmi python-docker:v1.0.0

# run the docker image
.PHONY: run
run:
	docker run python-docker

# build on port 5000 container
.PHONY: build-port
build-port:
	docker run --publish 8000:5000 python-docker

# run image in detached mode
.PHONY: detached
detached:
	docker run -d -p 8000:5000 python-docker

# see the running containers
.PHONY: ps
ps:
	docker ps

# stop the running container
.PHONY: stop
stop:
	docker stop <container-id>

# see the list of all containers
.PHONY: ps-all
ps-all:
	docker ps -a

# restart the container
.PHONY: restart
restart:
	docker restart <container-id>

# show list of all containers
.PHONY: ps-all
ps-all:
	docker ps -all

# remove the container
.PHONY: remove-container
remove-container:
	docker rm <container-id>

# run a container with a name
.PHONY: run-name
run-name:
	 docker run -d -p 8000:5000 --name rest-server python-docker