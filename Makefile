# GNU Make Makefile

# name of your container image
CNAME=elmdev

# the shared directory path between the host and the container image
# this should match WORKDIR and VOLUME in Dockerfile
SRCDIR=/app

DIR := ${CURDIR}

all: image

# start the elm reactor out of the current directory in the container
reactor:
	podman run -it -p 8000:8000 -v $PWD:/app:z localhost/elmdev elm reactor

image:
	podman build -t elmdev .

.PHONY: clean

imageclean:
	-podman rm $(shell podman ps -aq)
	-podman rmi $(shell podman images -q)
