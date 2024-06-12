#!/bin/sh

# Usage
# ./builder.sh gitUser/repo dockerUser/image

# This script requires either setting a DOCKER_TOKEN
# environment variable before running or already being logged in to dockerhub
# (via the `docker login` command)

repoFolder=dockerSrc
gitUrlPrefix=https://github.com/
gitUrlSuffix=.git
gitUrl="${gitUrlPrefix}$1${gitUrlSuffix}"

rm -rf $repoFolder
git clone $gitUrl $repoFolder
cd $repoFolder
docker build -t $2 .
docker login -u ${DOCKER_USER} -p ${DOCKER_TOKEN}
docker push $2
