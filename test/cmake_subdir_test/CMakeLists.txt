# Copyright 2018-2021 Peter Dimov
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 3.5...3.20)

project(cmake_subdir_test LANGUAGES CXX)

add_subdirectory(../.. boostorg/timer)
add_subdirectory(../../../assert boostorg/assert)
add_subdirectory(../../../config boostorg/config)
add_subdirectory(../../../core boostorg/core)
add_subdirectory(../../../mp11 boostorg/mp11)
add_subdirectory(../../../predef boostorg/predef)
add_subdirectory(../../../throw_exception boostorg/throw_exception)
add_subdirectory(../../../variant2 boostorg/variant2)
add_subdirectory(../../../winapi boostorg/winapi)

add_executable(main main.cpp)
target_link_libraries(main Boost::timer Boost::core)

enable_testing()
add_test(main main)
