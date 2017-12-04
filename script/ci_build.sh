#!/bin/bash

git --version
cmake --version

if [ -f /usr/bin/arm-none-eabi-gcc ];
then
    arm-none-eabi-gcc --version
else
    ${CC} --version
    ${CXX} --version
fi

