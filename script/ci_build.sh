#!/bin/bash

set -ex

if (( $# == 1 )); then
    echo "Use compat"
    BUILD_PARAMS="-DUSE_COMPAT=ON"
fi

git --version
cmake --version
${CC} --version
${CXX} --version

mkdir build && cd build
cmake ${BUILD_PARAMS} ..
make
