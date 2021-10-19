cmake_minimum_required(VERSION 3.12)

project (Fortran-CodeCoverage
  VERSION 1.0.0
  LANGUAGES Fortran)

find_package(PFUNIT REQUIRED)
enable_testing()

add_compile_options(-prof-gen=srcpos)

add_library(operators
  operators.F90
  )

set_target_properties (operators PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
  
target_include_directories(operators PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

add_pfunit_ctest (test_operators
  TEST_SOURCES test_operators.F90
  LINK_LIBRARIES operators
  )

