cmake_minimum_required(VERSION 3.4.1)

set (SRC_PATH src/main/cpp)

#--------------------------------dsp--------------------------------------------------------
add_library (dsp STATIC ${SRC_PATH}/dsp.cpp )
target_compile_options(dsp PRIVATE -std=c++11 -stdlib=libc++ -fno-rtti -fexceptions -Ofast)
target_link_libraries(dsp rsKernels_jni)
#--------------------------------native-lib-------------------------------------------------
add_library(native-lib SHARED src/main/cpp/native-lib.cpp)
target_link_libraries (native-lib dsp ${log-lib})