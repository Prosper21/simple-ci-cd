#!/bin/sh
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCKER_USERNAME/simple_ci_cd:$TAG .
docker push $DOCKER_USERNAME/simple_ci_cd:$TAG