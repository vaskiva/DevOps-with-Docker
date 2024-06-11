#!/bin/bash

docker run -d \
    --name watchtower \
    --env WATCHTOWER_POLL_INTERVAL=30 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    vaskivaara/exercise3_1
