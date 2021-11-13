# Fortran-Unit-Test-Trivial

This example shows a simple unit test in Fortran made with [pFUnit](https://github.com/Goddard-Fortran-Ecosystem/pFUnit). The output is the test result and the code coverage. 

## Building

The program can be built with `cmake`. 

### Supported compilers
* GNU Fortan
* Intel Fortran Compiler

### Required tools
* [pFUnit](https://github.com/Goddard-Fortran-Ecosystem/pFUnit)
* [lcov](https://github.com/linux-test-project/lcov) (only necessary for build with GNU Fortan)

To install pFUnit, follow the instructions on the linked github project page.

To install lcov on Ubuntu Linux use
```
sudo apt install lcov
```
To install lcov on macOS use
```
sudo port install lcov
```

To build, execute the test and generating of the coverage files, use the bash scripts `build_gfortran.x` or `build_ifort.x`, depending on the compiler you want to use. These scripts require a correct set PFUNIT_DIR environment variable. There is also a workflow implemented, which saves the coverage reports as an artifact, see https://github.com/Forsti5/Fortran-Unit-Test-Trivial/actions/runs/1413629312 and https://github.com/Forsti5/Fortran-Unit-Test-Trivial/blob/main/.github/workflows/main.yml.
