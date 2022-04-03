cmake_minimum_required(VERSION 3.12)

project (Fortran-CodeCoverage
  VERSION 1.0.0
  LANGUAGES Fortran)

include(AddGitSubmodule.cmake)
find_package(Git REQUIRED)

if(NOT DEFINED ENV{PFUNIT_DIR})
  message(STATUS "PFUNIT_DIR environment variable not set.")
  message(STATUS "Installing pFUnit and setting PFUNIT_DIR.")
  set(PFUNIT_DIR ${CMAKE_CURRENT_BINARY_DIR}/external/pFUnit/)
  add_git_submodule(${PROJECT_SOURCE_DIR}/external/pFUnit/)
else()
  include_directories($ENV{PFUNIT_DIR})
endif()

find_package(PFUNIT REQUIRED)
enable_testing()

if(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
   add_compile_options(-prof-gen=srcpos)
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
