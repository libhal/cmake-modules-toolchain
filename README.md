# cmake-modules-toolchain

[![🚀 deploy](https://github.com/libhal/cmake-modules-toolchain/actions/workflows/deploy.yml/badge.svg)](https://github.com/libhal/cmake-modules-toolchain/actions/workflows/deploy.yml)

A Conan tool package that provides a CMake toolchain for enabling C++ modules and `import std`.

## What it does

This package:

- Injects a CMake toolchain file that enables C++20 modules
- Sets the CMake generator to Ninja
- Provides CMake and Ninja as transitive dependencies (no separate installation needed)

The toolchain sets the following CMake variables (when supported by your compiler):

```cmake
set(CMAKE_CXX_SCAN_FOR_MODULES ON)
set(CMAKE_EXPERIMENTAL_EXPORT_PACKAGE_DEPENDENCIES "1942b4fa-b2c5-4546-9385-83f254070067")
```

### Compiler Requirements

**C++20 modules support:**

- GCC 14.0+
- Clang 18.0+
- MSVC 19.29+

## Usage

Add as a tool requirement in your `conanfile.py`:

```python
def build_requirements(self):
    self.tool_requires("cmake-modules-toolchain/1.0.3")
```

Or in your `conanfile.txt`:

```plaintext
[tool_requires]
cmake-modules-toolchain/1.0.3
```

The toolchain will automatically be included when using `CMakeToolchain` generator.

## License

Apache-2.0
