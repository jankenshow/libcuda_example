cmake_minimum_required(VERSION 3.21)
project(${LIB_NAME} LANGUAGES CXX CUDA)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CUDA_COMPUTE_CAPABILITY 75)
add_compile_options("$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CUDA>>:-G;-src-in-ptx>")

find_package(CUDA REQUIRED)
include(CheckLanguage)
check_language(CUDA)

set(LIB_TYPE "STATIC")
if(${LIB_TYPE} MATCHES "STATIC")
  set(LIB_TYPE_ARC "ARCHIVE")
else()
  set(LIB_TYPE_ARC "LIBRARY")
endif()

set(LIB_HEADERS CudaVecDouble.h)
set(LIB_SOURCES CudaVecDouble.cu)

if(CUDA_FOUND)
    message("Cuda version: " ${CUDA_VERSION})
    CUDA_ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE}
        ${LIB_SOURCES}
        # ${LIB_HEADERS}
    )
    target_include_directories(${LIB_NAME} INTERFACE ./)
endif()

install(TARGETS ${LIB_NAME} ${LIB_TYPE_ARC} DESTINATION "${INSTALL_DIR}/lib")
install(FILES ${LIB_HEADERS} DESTINATION "${INSTALL_DIR}/include")

message(INSTALL_DIR "${INSTALL_DIR}")