#!/bin/bash


mkdir build
cd build

cmake ..
cmake --build . -j

./Debug/x
