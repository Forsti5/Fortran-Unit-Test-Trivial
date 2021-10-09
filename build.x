#!/bin/bash -f

if [[ -d build ]]
then
    rm -rf build
fi

export FC=ifort

mkdir -p build
cd build
cmake .. -DCMAKE_PREFIX_PATH=$PFUNIT_DIR
make -j

export PROF_DIR=./coverage
mkdir -p coverage
ctest --verbose

profmerge *.dyn
cd coverage
codecov -prj Fortran-CodeCoverage -spi ../pgopti.spi -dpi pgopti.dpi -comp ../../comp_file.txt
