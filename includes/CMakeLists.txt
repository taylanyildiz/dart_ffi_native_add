cmake_minimum_required(VERSION 3.25)
project(native)
add_executable(native src/native_add.cpp )

set_target_properties(native PROPERTIES
    OUTPUT_NAME "native"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)

