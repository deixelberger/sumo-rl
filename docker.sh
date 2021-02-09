#!/bin/bash

DOCKER_IMG=mdei/sumo-rl:latest

#docker build -t "$DOCKER_IMG" .
docker pull "$DOCKER_IMG"

# "access control disabled, clients can connect from any host"
xhost +

docker run -it --rm \
    --name "run-sumo-rl" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$(pwd):/home/sumo-rl/" \
    -e DISPLAY=$DISPLAY \
    "$DOCKER_IMG"