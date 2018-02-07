ARG COMPILER

FROM registry.gitlab.com/offa/docker-images/${COMPILER}:stable

RUN mkdir deps && cd deps && \
        git clone --depth=1 https://github.com/cpputest/cpputest.git cpputest && \
        cd cpputest && mkdir _build && cd _build && \
        case ${CXX} in clang* ) export CXXFLAGS="-stdlib=libc++"; esac; \
        cmake -DC++11=ON -DTESTS=OFF .. && make && make install && \
        cd ../.. && \
        git clone --depth=1 --branch=3.4.0 https://github.com/opencv/opencv.git opencv && \
        cd opencv && mkdir build && cd build && \
        cmake -DBUILD_EXAMPLES=OFF \
                -DBUILD_TESTS=OFF \
                -DBUILD_PERF_TESTS=OFF  \
                -DBUILD_opencv_java=OFF \
                -DBUILD_opencv_python=OFF \
                -DBUILD_opencv_python2=OFF \
                -DBUILD_opencv_python3=OFF \
                .. && \
        make -j4 && make install && \
    cd .. && rm -rf deps
