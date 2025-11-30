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

# Enable C++20 modules support
# This toolchain automatically enables C++ modules support
# No user action required - just include this via Conan

# Skip during try_compile to avoid errors
if(NOT CMAKE_CURRENT_SOURCE_DIR MATCHES "CMakeScratch")
  # Enable C++20 modules scanning
  set(CMAKE_CXX_SCAN_FOR_MODULES ON)

  # Enable experimental package dependency export for modules
  set(CMAKE_EXPERIMENTAL_EXPORT_PACKAGE_DEPENDENCIES "1942b4fa-b2c5-4546-9385-83f254070067")

  # Print status message after project() is called
  function(_libhal_modules_status)
    message(STATUS "C++20 modules support enabled")
  endfunction()
  cmake_language(DEFER CALL _libhal_modules_status)
endif()
