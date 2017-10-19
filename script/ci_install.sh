#!/bin/bash

mkdir -p ${DEPENDENCY_DIR} && cd ${DEPENDENCY_DIR}


# Install a newer CMake version
curl -sSL https://cmake.org/files/v3.8/cmake-3.8.2-Linux-x86_64.sh -o install-cmake.sh
chmod +x install-cmake.sh
sudo ./install-cmake.sh --prefix=/usr/local --skip-license


# Install Libc++
if [[ ! -d "$(ls -A ${DEPENDENCY_DIR}/llvm-source)" ]]; then
    LLVM_RELEASE=release_50
    git clone --depth=1 -b ${LLVM_RELEASE} https://github.com/llvm-mirror/llvm.git llvm-source
    git clone --depth=1 -b ${LLVM_RELEASE} https://github.com/llvm-mirror/libcxx.git llvm-source/projects/libcxx
    git clone --depth=1 -b ${LLVM_RELEASE} https://github.com/llvm-mirror/libcxxabi.git llvm-source/projects/libcxxabi

    if [[ -z "$BUILD_32_BITS" ]]; then
      export BUILD_32_BITS=OFF && echo disabling 32 bit build
    fi

    mkdir llvm-build && cd llvm-build
    cmake -DCMAKE_C_COMPILER=${CC} \
            -DCMAKE_CXX_COMPILER=${CXX} \
            -DCMAKE_BUILD_TYPE=RelWithDebInfo \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DLLVM_BUILD_32_BITS=${BUILD_32_BITS} \
            ../llvm-source
    make cxx -j4
    sudo make install-cxxabi install-cxx
fi

cd ${TRAVIS_BUILD_DIR}
