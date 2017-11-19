#!/bin/bash

set -ex

if [[ "${CXX}" == clang* ]]
then
    export CXXFLAGS="-stdlib=libc++"
fi


git --version
cmake --version
${CC} --version
${CXX} --version

mkdir build && cd build
cmake ${BUILD_PARAMS} ..
make
