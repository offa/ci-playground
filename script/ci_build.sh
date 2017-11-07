#!/bin/bash

set -ex

if [[ "${CC}" = clang-4.0 ]]
then
    echo "Use compat clang"
    BUILD_PARAMS="-DUSE_COMPAT=ON"
fi

if [[ "${CC}" = gcc-5 ]]
then
    echo "Use compat gcc"
    BUILD_PARAMS="-DUSE_COMPAT=ON"
fi

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
