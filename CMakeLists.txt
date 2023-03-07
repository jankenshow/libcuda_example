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

# Add sub project
add_subdirectory(src/double_vec)
target_include_directories(run PUBLIC src/double_vec)
target_link_libraries(run CudaVecDouble)