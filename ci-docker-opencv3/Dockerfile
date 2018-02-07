ARG COMPILER

FROM registry.gitlab.com/offa/docker-images/${COMPILER}:stable

RUN add-apt-repository ppa:timsc/opencv-3.3 && apt-get update && \
        apt-get install -y --no-install-recommends opencv && \
    mkdir deps && cd deps && \
        git clone --depth=1 https://github.com/cpputest/cpputest.git cpputest && \
        cd cpputest && mkdir _build && cd _build && \
        case ${CXX} in clang* ) export CXXFLAGS="-stdlib=libc++"; esac; \
        cmake -DC++11=ON -DTESTS=OFF .. && make && make install && \
        cd ../.. && \
    cd .. && rm -rf deps
