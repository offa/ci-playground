#!/bin/bash


mkdir build
cd build

cmake ..
make -j
ls -la
./x
