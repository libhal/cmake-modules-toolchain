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

from conan import ConanFile
from conan.tools.files import copy
import os


required_conan_version = ">=2.2.0"


class cmake_modules_toolchain_conan(ConanFile):
    name = "cmake-modules-toolchain"
    version = "1.0.1"
    license = "Apache-2.0"
    homepage = "https://github.com/libhal/cmake-modules-toolchain"
    description = "CMake toolchain for enabling C++ modules and import std"
    topics = ("cmake", "c++modules", "libhal")
    exports_sources = ("cmake/*", "LICENSE")
    no_copy_source = True

    def package_id(self):
        self.info.clear()

    def package(self):
        copy(self, "LICENSE", dst=os.path.join(
            self.package_folder, "licenses"), src=self.source_folder)
        copy(self, "cmake/*.cmake", src=self.source_folder,
             dst=self.package_folder)

    def package_info(self):
        toolchain_path = os.path.join(
            self.package_folder, "cmake/modules_toolchain.cmake")
        self.conf_info.append(
            "tools.cmake.cmaketoolchain:user_toolchain",
            toolchain_path)
