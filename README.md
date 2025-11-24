# cmake-modules-toolchain

[![🚀 deploy](https://github.com/libhal/cmake-modules-toolchain/actions/workflows/deploy.yml/badge.svg)](https://github.com/libhal/cmake-modules-toolchain/actions/workflows/deploy.yml)

A Conan tool package that provides a CMake toolchain for enabling C++ modules and `import std`.

## What it does

This package:

- Injects a CMake toolchain file that conditionally enables C++20 modules and `import std` based on compiler version
- Sets the CMake generator to Ninja
- Provides CMake and Ninja as transitive dependencies (no separate installation needed)

The toolchain sets the following CMake variables (when supported by your compiler):

```cmake
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "d0edc3af-4c50-42ea-a356-e2862fe7a444")
set(CMAKE_CXX_MODULE_STD ON)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)
```

### Compiler Requirements

**C++20 modules support:**

- GCC 14.0+
- Clang 18.0+
- MSVC 19.29+

**`import std` support:**

- GCC 15.0+
- Clang 18.1.2+
- MSVC 19.40+

If your compiler doesn't meet these requirements, the toolchain will gracefully disable the unsupported features and emit status messages.

## Usage

Add as a tool requirement in your `conanfile.py`:

```python
def build_requirements(self):
    self.tool_requires("cmake-modules-toolchain/1.0.2")
```

Or in your `conanfile.txt`:

```plaintext
[tool_requires]
cmake-modules-toolchain/1.0.2
```

The toolchain will automatically be included when using `CMakeToolchain` generator.

## License

Apache-2.0
