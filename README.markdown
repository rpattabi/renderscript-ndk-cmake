This example project uses renderscript through NDK/C++ with CMake as the build system.
This is created to reproduce a problem with renderscript support mode described [here](https://stackoverflow.com/q/50627520/15139).

In order to make android studio not complain gradle sync, run `./gradlew installRelease` and `./gradlew installDebug` from the terminal, so that `ScripC_compute.cpp` and `ScriptC_compute.h` files are generated first.

As it is, call to renderscript will fail at runtime, since `renderscriptTargetApi` set as 24 does not generate `librs.compute.so`. It is generated if `renderscriptTargetApi` is 19 or 20 limiting us to older APIs.
