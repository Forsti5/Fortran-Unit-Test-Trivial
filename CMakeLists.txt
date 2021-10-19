cmake_minimum_required(VERSION 3.12)

project (Fortran-CodeCoverage
  VERSION 1.0.0
  LANGUAGES Fortran)

if("$ENV{PFUNIT_TEST}" STREQUAL "TRUE")
    find_package(PFUNIT REQUIRED)
    enable_testing()
endif()

if(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
   add_compile_options(-prof-gen=srcpos)
endif()

add_library(operators
  operators.F90
  )

set_target_properties (operators PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
  
target_include_directories(operators PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

if("$ENV{PFUNIT_TEST}" STREQUAL "TRUE")
add_pfunit_ctest (test_operators
 TEST_SOURCES test_operators.F90
 LINK_LIBRARIES operators
 )
endif()
