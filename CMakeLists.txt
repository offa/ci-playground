cmake_minimum_required(VERSION 3.8.2)

project(ci-test VERSION 0.0.1)

option(USE_COMPAT "Compat setting to enable build" OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(ci-test Main.cpp)

if( USE_COMPAT )
    target_compile_definitions(ci-test PRIVATE -DUSE_COMPAT)
endif()
