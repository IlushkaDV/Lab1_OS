cmake_minimum_required(VERSION 3.10)
project(HelloWorld VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Отладочная информация
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Building in Debug mode with debug symbols")
endif()

add_executable(hello-world src/main.cpp)

# Установка отладочных символов
set_target_properties(hello-world PROPERTIES DEBUG_POSTFIX "d")
