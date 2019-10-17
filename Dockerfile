FROM registry.gitlab.com/offa/docker-images/base-cpp:latest

RUN curl -Lo arm-none-eabi-gcc.tar.bz2 https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 && \
    mkdir -p /opt/arm-none-eabi && \
    tar xjf arm-none-eabi-gcc.tar.bz2 -C /opt/arm-none-eabi/ --strip-components 1 && \
    chmod -R -w /opt/arm-none-eabi && \
    rm *.tar.bz2

ENV PATH="${PATH}:/opt/arm-none-eabi/bin"

RUN arm-none-eabi-gcc --version && \
    arm-none-eabi-g++ --version