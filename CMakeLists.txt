cmake_minimum_required(VERSION 3.9)

project(cpp-template CXX)

set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "Suppressing benchmark's tests" FORCE)
add_subdirectory(thirdparty/benchmark)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/thirdparty/sanitizers-cmake/cmake" ${CMAKE_MODULE_PATH})
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 11)

add_subdirectory(thirdparty/catch)
add_subdirectory(src)
add_subdirectory(test)
if ((NOT SANITIZE_ADDRESS) AND (NOT SANITIZE_THREAD) AND (NOT SANITIZE_UNDEFINED))
    add_subdirectory(bench)
endif ()
