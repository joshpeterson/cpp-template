cmake_minimum_required(VERSION 3.9)

project(cpp-template CXX)

if (MSVC)
  add_compile_options(/W4 /WX)
else()
  add_compile_options(-Wall -Wextra -pedantic -Werror)
endif()

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/thirdparty/sanitizers-cmake/cmake" ${CMAKE_MODULE_PATH})
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(thirdparty/catch)
add_subdirectory(src)
add_subdirectory(test)
