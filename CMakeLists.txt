# Copyright 2021, Collabora, Ltd.
#
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.10.2)
project(jnipp)

find_package(Java COMPONENTS Development)
find_package(JNI REQUIRED)
include(CTest)

message(STATUS "JNI_INCLUDE_DIRS: ${JNI_INCLUDE_DIRS}")

add_library(jnipp jnipp.cpp)
target_include_directories(
  jnipp
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE ${JNI_INCLUDE_DIRS})
target_compile_definitions(jnipp PUBLIC -DJVM_PATH=$<TARGET_FILE:JNI::JVM>)
target_compile_options(jnipp PUBLIC -ldl -std=c++11 -Wall -g)
target_link_libraries(jnipp PUBLIC ${CMAKE_DL_LIBS})

add_subdirectory(tests)
