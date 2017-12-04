#!/bin/bash

${CC} --version
${CXX} --version
cmake --version

if [ -f /usr/bin/arm-none-eabi-gcc ];
then
    arm-none-eabi-gcc --version
fi

