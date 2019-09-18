set(SOURCES
  "hello_test.cpp"
)

find_package(Sanitizers)

set(LIB_NAME ${PROJECT_NAME}_lib)
set(TEST_NAME tests)

add_executable(${TEST_NAME} test_main.cpp ${SOURCES})
add_sanitizers(${TEST_NAME})
target_link_libraries(${TEST_NAME} PRIVATE ${LIB_NAME} catch)
target_compile_definitions(${TEST_NAME} PRIVATE CATCH_CONFIG_CONSOLE_WIDTH=60)

if (MSVC)
  target_compile_options(${TEST_NAME} PRIVATE "/IW4")
  target_compile_options(${TEST_NAME} PRIVATE "/WX")
else()
  target_compile_options(${TEST_NAME} PRIVATE "-Wall")
  target_compile_options(${TEST_NAME} PRIVATE "-Wextra")
  target_compile_options(${TEST_NAME} PRIVATE "-Werror")
  target_compile_options(${TEST_NAME} PRIVATE "-pedantic")
endif()
