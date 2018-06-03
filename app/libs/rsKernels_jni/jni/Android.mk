LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := rsKernels_jni

RS_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.rs)
RS_SRC_FILES := $(RS_SRC_FILES:$(LOCAL_PATH)/%=%)

CPP_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)
CPP_SRC_FILES := $(CPP_SRC_FILES:$(LOCAL_PATH)/%=%)

CPP_HDR_FILES := $(wildcard $(LOCAL_PATH)/*.h)
CPP_HDR_FILES := $(CPP_HDR_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES := $(CPP_SRC_FILES) $(RS_SRC_FILES)
LOCAL_C_INCLUDES := $(CPP_HDR_FILES)

LOCAL_CLANG := true

LOCAL_CFLAGS := -std=c++11
LOCAL_LDFLAGS := -Wl,-Bsymbolic

LOCAL_LDLIBS := \
	-ldl \
	-llog \

LOCAL_RENDERSCRIPT_COMPATIBILITY := true

LOCAL_SHARED_LIBRARIES := RSSupport blasV8 RSSupportIO
LOCAL_STATIC_LIBRARIES := RScpp_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/renderscript)