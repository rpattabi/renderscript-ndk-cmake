#include <jni.h>
#include <string>
#include "dsp.h"

extern "C" JNIEXPORT
jstring JNICALL
Java_com_example_renderscript_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */,
        jstring appCacheDir
) {
    char *app_cache_dir = (char *) env->GetStringUTFChars(appCacheDir, NULL);

    Dsp dsp(app_cache_dir);
    dsp.call_rs();

    env->ReleaseStringUTFChars(appCacheDir, app_cache_dir);

    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}
