# Copyright 2025 Khalil Estell and the libhal contributors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Enable C++20/23 modules support
# Skip during try_compile (compiler detection) to avoid __CMAKE::CXX23 errors
if(NOT CMAKE_CURRENT_SOURCE_DIR MATCHES "CMakeScratch")
  block()
    # Version requirements:
    # C++20 modules: GCC 14+, Clang 18+, MSVC 19.29+
    # import std: GCC 15+, Clang 18.1.2+, MSVC 19.40+
    set(_MODULES_SUPPORTED OFF)
    set(_IMPORT_STD_SUPPORTED OFF)

    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "14.0")
        set(_MODULES_SUPPORTED ON)
      endif()
      if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "15.0")
        set(_IMPORT_STD_SUPPORTED ON)
      endif()
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang" OR
           CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
      if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "18.0")
        set(_MODULES_SUPPORTED ON)
      endif()
      if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "18.1.2")
        set(_IMPORT_STD_SUPPORTED ON)
      endif()
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "19.29")
        set(_MODULES_SUPPORTED ON)
      endif()
      if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "19.40")
        set(_IMPORT_STD_SUPPORTED ON)
      endif()
    endif()

    if(_MODULES_SUPPORTED)
      set(CMAKE_CXX_MODULE_STD ON PARENT_SCOPE)
      set(CMAKE_CXX_SCAN_FOR_MODULES ON PARENT_SCOPE)
    else()
      message(STATUS "C++20 modules disabled: ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION} does not support it")
    endif()

    if(_IMPORT_STD_SUPPORTED)
      set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "d0edc3af-4c50-42ea-a356-e2862fe7a444" PARENT_SCOPE)
    else()
      message(STATUS "import std disabled: ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION} does not support it")
    endif()
  endblock()
endif()
