#!/bin/bash

python --version

pip install -U conan
conan profile detect
echo "tools.cmake.cmaketoolchain:generator=Ninja" >> ~/.conan2/global.conf


conan install --build=missing --output-folder=_dist .
