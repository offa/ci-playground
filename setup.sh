#!/bin/bash

set -e

git clone https://github.com/rollbear/trompeloeil.git
cd trompeloeil
mkdir build
cd build

cmake ..
cmake --build . -j
cmake --build . --target install
