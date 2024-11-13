#!/bin/bash


mkdir build
cd build

cmake ..
cmake --build . -j

ls -la
./x
