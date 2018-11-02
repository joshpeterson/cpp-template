# C++ Project Template

[![Build
Status](https://travis-ci.org/joshpeterson/cpp-template.svg?branch=master)](https://travis-ci.org/joshpeterson/cpp-template)

This is a template project for C++. It uses [CMake](https://cmake.org/) to build
and [Catch](https://github.com/catchorg/Catch2) for unit tests. It is integrated
with Travis CI, and builds on Windows, macOS, and Linux. It
consists of one static library, one main function, and one test executable.

## How to use this project

I like to use this project as a starting point for C++ projects. It has builds,
tests, code formatting, static and dynamic analysis, and CI integration set up and
ready to go.

### Quick start

The
[cpp-template-installer.py](https://github.com/joshpeterson/cpp-template/blob/master/cpp-template-installer.py)
script can be used to quickly create a project (you'll need to have
[python](https://www.python.org/) installed):

```
> curl https://raw.githubusercontent.com/joshpeterson/cpp-template/master/cpp-template-installer.py | python - <my project name>
```

Just replace `<my project name>` with the name of your project.

### Manual installation

These are the step the python script above performs. You can do them manually as
well:

1. Clone or download the source code.
2. Remove the `.git/` directory, if is exists.
3. Search the project for "cpp-template" and replace it with the name of your
project.
5. Replace this README.md file with one for your project.

## Building

On Linux, you will need a C++ compiler installed, then run:

```
> sudo apt install cmake ninja-build
> git clone git@github.com:joshpeterson/cpp-template.git
> ./build
```

On macOS, you will need to have Xcode installed, then run:

```
> brew install cmake ninja
> git clone git@github.com:joshpeterson/cpp-template.git
> ./build
```

On Windows, you will need have Visual Studio installed with C++ tools, then run:

```
> git clone git@github.com:joshpeterson/cpp-template.git
> build
```

The build output should live in a directory named `artifacts`.

## Project structure

The project has the following top-level directories:

* The `src` directory is the location of all of the project's source code (header
  files and source files). The `main.cpp` file is built into the final executable,
  all other source files in this directory are built into a static library. Only
  code in this static library will be tested.
* The `test` directory contains the unit tests. The unit test executable links with
  the static library built from `src` directory.
* The `thirdparty` directory contains external code used by this project, namely,
  Catch and the CMake sanitizer integration.
* The `tools` directory contains a number of scripts used for building and other
  tool integration with the project.

## Other tool integration

The project integrates with a few other tools to aid in development.

* The clang-format utility is used to enforce common source code formatting. The
  `tools/format` script can be used locally to update code formatting to match the
  style in the `.clang-format` file. The `tools/run-clang-format.py` script is used
  on Travis CI to check formatting.
* The clang-tidy utility is used to run static analysis on the source code. The
  `tools/tidy` script can be used locally and on Travis CI to run clang-tidy.
* The clang address, thread, and undefined behavior sanitizers are run on the unit
  tests. The `tools/sanitize` script can be used to run them locally.

These tooling scripts are configured to run on Linux.

## License

This project is available in the public domain.

## Acknowledgements

The project is based on the [Hello CMake](https://github.com/arnemertz/hello_cmake)
project from Arne Mertz.

It uses the [sanitizers-cmake](https://github.com/arsenm/sanitizers-cmake) for
CMake integration of clang's sanitizers.
