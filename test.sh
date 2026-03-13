#!/bin/bash

set -ex

git clone --depth=1 https://github.com/catchorg/Catch2.git catch2

mkdir -p catch2/build
cd catch2/build

cmake -DCATCH_DEVELOPMENT_BUILD=ON -DCATCH_ENABLE_WERROR=OFF ..
make -j
