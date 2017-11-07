#!/bin/bash

set -ex

git --version
cmake --version
${CC} --version
${CXX} --version

mkdir build && cd build
cmake ..
make
