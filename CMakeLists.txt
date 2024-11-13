cmake_minimum_required(VERSION 3.12.0)


project(x)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Catch2 REQUIRED)
find_package(trompeloeil REQUIRED)

add_executable(x test.cpp)
target_link_libraries(x PRIVATE
    Catch2::Catch2WithMain
    trompeloeil::trompeloeil
    )
