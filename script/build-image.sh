#!/bin/sh

set -ex

IMG=$1
IMG_PATH=$2

if [ "$3" != "--no-arg" ]; then
    BUILD_ARG="--build-arg COMPILER=${IMG}"
fi

DEV_IMAGE=${DEPLOY_REGISTRY}/${IMG}

docker build --pull -t ${DEV_IMAGE} ${IMG_PATH} ${BUILD_ARG}
docker push ${DEV_IMAGE}

