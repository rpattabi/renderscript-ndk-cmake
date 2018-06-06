LOCAL_PATH := $(call my-dir)
INCLUDE_PATH := $(NDK_ROOT)/sources/cxx-stl/system/include

include $(CLEAR_VARS)
LOCAL_MODULE := rsKernels_jni

RS_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.rs)
CPP_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)

LOCAL_SRC_FILES := $(CPP_SRC_FILES) $(RS_SRC_FILES)
LOCAL_C_INCLUDES := $(INCLUDE_PATH) $(LOCAL_PATH)

LOCAL_CLANG := true
LOCAL_LDFLAGS := -Wl,-Bsymbolic

LOCAL_LDLIBS := \
	-ldl \
	-llog \

LOCAL_RENDERSCRIPT_COMPATIBILITY := true
LOCAL_RENDERSCRIPT_FLAGS := -rs-package-name=android.support.v8.renderscript
LOCAL_SHARED_LIBRARIES := RSSupport blasV8 RSSupportIO
LOCAL_STATIC_LIBRARIES := RScpp_static

LOCAL_SDK_VERSION := current
include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/renderscript)