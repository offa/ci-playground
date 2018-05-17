#!/bin/bash

set -ex


git clone https://github.com/offa/plug.git
cd plug
${CXX} --version
script/ci_build.sh -ubsan -asan
