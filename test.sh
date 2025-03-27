#!/bin/bash

set -ex

python --version

pip install -U conan
conan profile detect
echo "tools.cmake.cmaketoolchain:generator=Ninja" >> ~/.conan2/global.conf


conan create \
    --build=missing \
    --version=1.84.0 \
    -o "boost/*:without_python"=False \
    -o "boost/*:without_numpy"=True \
    recipes/boost/all
