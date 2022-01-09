cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(collatz_conjecture LANGUAGES CXX CUDA)

target_compile_features(collatz PUBLIC cxx_std_11)

set_target_properties(collatz PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

add_executable(collatz collatz.cu)

target_compile_features(collatz PUBLIC cxx_std_11)

if (NOT CMAKE_CUDA_COMPILER)
  message(FATAL_ERROR "CUDA not found. 
CUDA support will not be compiled.
To install CUDA, please visit this link:

https://developer.nvidia.com/cuda-downloads

")
else()
  enable_language(CUDA)
  set(CMAKE_CUDA_FLAGS_DEBUG "")
  set(CMAKE_CUDA_FLAGS_RELEASE "")
  set(CMAKE_CUDA_FLAGS_RELWITHDEBINFO "")
  set(CMAKE_CUDA_FLAGS_RELWITHDEBINFOPORTABLE "")
endif()

set_property(TARGET collatz
    PROPERTY
    BUILD_RPATH ${CMAKE_CUDA_IMPLICIT_LINK_DIRECTORIES}
)

if(gpu_count EQUAL 1)
  message(STATUS "Detected the GPU!")
elseif(gpu_count GREATER 1)
  message(STATUS "Detected the GPUs!")
else()
  message(FATAL_ERROR "No GPU has been detected. Either You do not have a GPU or it is misconfigured.")
endif()

if(APPLE)
  set_property(TARGET collatz
    PROPERTY
    BUILD_RPATH ${CMAKE_CUDA_IMPLICIT_LINK_DIRECTORIES}
  )
endif()

# https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#gpu-compilation

if(NOT DEFINED CLI11_DIR)
set (CLI11_DIR "/opt/CLI11" CACHE STRING "CLI11 git repository")
endif()
include_directories(${CLI11_DIR}/include)

include(FetchContent)
FetchContent_Declare(
  cli11
  GIT_REPOSITORY https://github.com/CLIUtils/CLI11
  GIT_TAG        v2.1.2
)

FetchContent_MakeAvailable(cli11)