set(SOURCES
  "hello.cpp"
  "hello.h"
)

find_package(Sanitizers)

set(LIB_NAME ${PROJECT_NAME}_lib)

add_library(${LIB_NAME} STATIC ${SOURCES})
add_sanitizers(${LIB_NAME})
set_target_properties(${LIB_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})

target_include_directories(${LIB_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_executable(${PROJECT_NAME} main.cpp)
add_sanitizers(${PROJECT_NAME})
target_link_libraries(${PROJECT_NAME} PRIVATE ${LIB_NAME})

if (MSVC)
  target_compile_options(${LIB_NAME} PRIVATE "/IW4")
  target_compile_options(${LIB_NAME} PRIVATE "/WX")
else()
  target_compile_options(${LIB_NAME} PRIVATE "-Wall")
  target_compile_options(${LIB_NAME} PRIVATE "-Wextra")
  target_compile_options(${LIB_NAME} PRIVATE "-Werror")
  target_compile_options(${LIB_NAME} PRIVATE "-pedantic")
endif()
