# cmake-modules-toolchain

A Conan tool package that provides a CMake toolchain for enabling C++ modules and `import std`.

## What it does

This package injects a CMake toolchain file that sets:

```cmake
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "d0edc3af-4c50-42ea-a356-e2862fe7a444")
set(CMAKE_CXX_MODULE_STD ON)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)
```

## Usage

Add as a tool requirement in your `conanfile.py`:

```python
def build_requirements(self):
    self.tool_requires("cmake-modules-toolchain/1.0.0")
```

Or in your `conanfile.txt`:

```plaintext
[tool_requires]
cmake-modules-toolchain/1.0.0
```

The toolchain will automatically be included when using `CMakeToolchain` generator.

## License

Apache-2.0
