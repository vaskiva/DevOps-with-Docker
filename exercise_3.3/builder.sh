#!/bin/bash

#This script requires setting a DOCKER_TOKEN environment variable before running

gitUrlPrefix=git@github.com
gitUrlSuffix=.git
gitUrl="${gitUrlPrefix}$1${gitUrlSuffix}"
dockerUser="${2%%/*}"

git clone $gitUrl dockerSrc
cd dockerScr
docker build -t $2 .
docker login -u ${dockerUser} -p ${DOCKER_TOKEN}
docker push $2
