#!/bin/bash

# replace the PLACEHOLDER DOCKER_TOKEN

docker run \
    -e DOCKER_USER=vaskivaara \
    -e DOCKER_TOKEN=PLACEHOLDER \
    -v /var/run/docker.sock:/var/run/docker.sock \
    builder vaskiva/DevOps-with-Docker vaskivaara/exercise3_4
