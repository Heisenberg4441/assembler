cmake_minimum_required(VERSION 3.26)
project(asm_arm64 ASM)

set(CMAKE_OSX_ARCHITECTURES "arm64")

add_executable(hello hello.s)

# entrypoint без main
target_link_options(hello PRIVATE "-Wl,-e,_start")
