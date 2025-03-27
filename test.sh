#!/bin/bash

python --version

pip install -U conan
conan profile detect
echo "tools.cmake.cmaketoolchain:generator=Ninja" >> ~/.conan2/global.conf


conan create --build=missing --version=1.84.0 recipes/boost/all
