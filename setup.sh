#!/bin/bash

set -e

git clone https://github.com/catchorg/Catch2.git
cd Catch2
mkdir build
cd build

cmake ..
cmake --build . -j
cmake --build . --target install



git clone https://github.com/rollbear/trompeloeil.git
cd trompeloeil
mkdir build
cd build

cmake ..
cmake --build . -j
cmake --build . --target install
