find_package(CUDA REQUIRED)
if(CUDA_FOUND)
    message("Cuda version: " ${CUDA_VERSION})
    CUDA_ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE}
        ${LIB_SOURCES}
        ${LIB_HEADERS}
    )
endif()