# Wersja CMake
cmake_minimum_required(VERSION 3.9)

# Dir to project
project(hello_cpp_docker)

# C++ 17
set(CMAKE_CXX_STANDARD 17)

# Set our source files
set(SOURCE_FILES main.cpp)

# Create our executable file
add_executable(cppdocker_run ${SOURCE_FILES})
