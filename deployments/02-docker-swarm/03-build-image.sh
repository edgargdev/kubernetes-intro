#!/usr/bin/env bash

SWARM_PREFIX=${SWARM_PREFIX:-swarm}
PRIMARY_MANAGER_NODE="${SWARM_PREFIX}-manager-1"
eval $(docker-machine env ${PRIMARY_MANAGER_NODE})
export DOCKER_API_VERSION=$(docker version --format '{{.Server.APIVersion}}')

pushd ../..
  ./build.sh
  docker build --tag ${DOCKER_REGISTRY_NAMESPACE}/example-app .
popd
