# GNU Make Makefile

# name of your container image
CNAME=devbox

# the shared directory path between the host and the container image
# this should match WORKDIR and VOLUME in Dockerfile
SRCDIR=/app

DIR := ${CURDIR}

all: image

# start the lang specific targets

reactor:
	podman run -it -p 8000:8000 -v $PWD:/app:z localhost/elmdev elm reactor

# make the initial image
image:
	podman build -t devbox .

.PHONY: clean

imageclean:
	-podman rm $(shell podman ps -aq)
	-podman rmi $(shell podman images -q)
