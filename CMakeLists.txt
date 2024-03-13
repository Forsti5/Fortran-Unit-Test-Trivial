cmake_minimum_required(VERSION 3.12)

project (Fortran-CodeCoverage
  VERSION 1.0.0
  LANGUAGES Fortran)

find_package(PFUNIT REQUIRED)
enable_testing()


if(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
   add_compile_options(-fprofile-generate=srcpos)
endif()

add_library(operators
  operators.F90
  )
  
if(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
   target_compile_options(operators PRIVATE --coverage)
   add_link_options(--coverage)
endif()

set_target_properties (operators PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
  
target_include_directories(operators PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

add_pfunit_ctest (test_operators
 TEST_SOURCES test_operators.F90
 LINK_LIBRARIES operators
 )
