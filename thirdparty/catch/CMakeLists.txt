project (Catch)

# Header only library, therefore INTERFACE
add_library(catch INTERFACE)

# INTERFACE targets only have INTERFACE properties
target_include_directories(catch INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_features(catch INTERFACE cxx_std_11)
