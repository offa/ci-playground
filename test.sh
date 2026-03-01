#!/bin/bash

set -ex

git clone --branch=v3.13.0 --depth=1 https://github.com/catchorg/Catch2.git
cd Catch2
mkdir build && cd build
cmake ..
make -j
