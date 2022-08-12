#!/bin/bash -f

if [[ -d build ]]
then
    rm -rf build
fi

export FC=gfortran

mkdir -p build
cd build
cmake .. -DCMAKE_PREFIX_PATH=$PFUNIT_DIR
make -j

ctest --verbose
cd CMakeFiles/operators.dir/

lcov --gcov-tool gcov --capture --directory . --output-file covered.info
lcov --gcov-tool gcov --capture -i --directory . --output-file uncovered.info
lcov -a covered.info -a uncovered.info --output-file result.info
genhtml --output-directory ../../coverage result.info
