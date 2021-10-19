#!/bin/bash -f

if [[ -d build ]]
then
    rm -rf build
fi

export PFUNIT_TEST=TRUE

mkdir -p build
cd build
if [[ $PFUNIT_TEST = "TRUE" ]]
then
  cmake .. -DCMAKE_PREFIX_PATH=$PFUNIT_DIR
else
  cmake ..
fi
make -j

if [[ $PFUNIT_TEST = "TRUE" ]]
then
  if [[ $FC = "ifort" ]]
  then
    export PROF_DIR=./coverage
    mkdir -p coverage
  fi

  ctest --verbose

  if [[ $FC = "ifort" ]]
  then
    profmerge *.dyn
    cd coverage
    codecov -prj Fortran-CodeCoverage -spi ../pgopti.spi -dpi pgopti.dpi -comp ../../comp_file.txt -ccolor '#d7fad2'
  fi
fi
