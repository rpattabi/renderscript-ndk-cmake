cmake_minimum_required(VERSION 3.4.1)

set (SRC_PATH src/main/cpp)
find_library(log-lib log)

#------------------------------ renderscript -----------------------------------------
set (SRC_RS_PATH src/main/rs)
set(RENDER_SCRIPT_HEADERS_PATH ${ANDROID_NDK}/toolchains/renderscript/prebuilt/${ANDROID_HOST_TAG}/platform/rs)

if(${CMAKE_BUILD_TYPE} MATCHES Release)
    set (SRC_RS_GENERATED_PATH build/generated/source/rs/release)
else()
    set (SRC_RS_GENERATED_PATH build/generated/source/rs/debug)
endif()

include_directories(
    ${RENDER_SCRIPT_HEADERS_PATH}/cpp
    ${RENDER_SCRIPT_HEADERS_PATH}/scriptc
    ${RENDER_SCRIPT_HEADERS_PATH}
    ${SRC_RS_GENERATED_PATH}
)

link_directories(${ANDROID_NDK}/toolchains/renderscript/prebuilt/${ANDROID_HOST_TAG}/platform/${ANDROID_SYSROOT_ABI})

#--------------------------------dsp--------------------------------------------------------
add_library (dsp STATIC
    ${SRC_PATH}/dsp.cpp
    ${SRC_RS_PATH}/compute.rs ${SRC_RS_GENERATED_PATH}/ScriptC_compute.cpp
)
target_compile_options(dsp PRIVATE -std=c++11 -stdlib=libc++ -fno-rtti -fexceptions -Ofast)
target_link_libraries(dsp RScpp_static dl ${log-lib})

#--------------------------------native-lib-------------------------------------------------
add_library(native-lib SHARED src/main/cpp/native-lib.cpp)
target_link_libraries (native-lib dsp ${log-lib})