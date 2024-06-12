#!/bin/bash -x

# Usage
# ./builder.sh gitUser/repo dockerUser/image

# This script requires either setting a DOCKER_TOKEN
# environment variable before running or already being logged in to dockerhub
# (via the `docker login` command)

repoFolder=dockerSrc
gitUrlPrefix=git@github.com:
gitUrlSuffix=.git
gitUrl="${gitUrlPrefix}$1${gitUrlSuffix}"
dockerUser="${2%%/*}"

rm -rf $repoFolder
git clone $gitUrl $repoFolder
cd $repoFolder
docker build -t $2 .
docker login -u ${dockerUser} -p ${DOCKER_TOKEN}
docker push $2
