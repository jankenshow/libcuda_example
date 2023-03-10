cmake_minimum_required(VERSION 2.8)
project(MyCudaProject)

# Create run project
set(SOURCES
    src/main.cpp
)
# set(HEADERS)

add_executable(run
    ${SOURCES}
    ${HEADERS}
)

set(LIB_TYPE "STATIC")

if(${LIB_TYPE} MATCHES "STATIC")
  set(LIB_TYPE_ARC "ARCHIVE")
else()
  set(LIB_TYPE_ARC "LIBRARY")
endif()

# Add sub project
set(LIB_NAME CudaVecDouble)
set(LIB_BASE_DIR src/double_vec)
set(LIB_HEADER CudaVecDouble.h)
add_subdirectory(${LIB_BASE_DIR})
target_include_directories(run PUBLIC ${LIB_BASE_DIR})
target_link_libraries(run ${LIB_NAME})

# install
set(INSTALL_DIR "${CMAKE_CURRENT_SOURCE_DIR}/install")

install(TARGETS CudaVecDouble ${LIB_TYPE_ARC} DESTINATION "${INSTALL_DIR}/lib")
install(FILES ${LIB_BASE_DIR}/${LIB_HEADER} DESTINATION "${INSTALL_DIR}/include")
