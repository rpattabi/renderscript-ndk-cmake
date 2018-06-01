# Renderscript + NDK + CMake

This example project uses renderscript through NDK/C++ with CMake as the build system.

## Workaround to fix gradle sync
In order to make android studio not complain gradle sync, run `./gradlew installRelease` and `./gradlew installDebug` from the terminal, so that `ScripC_compute.cpp` and `ScriptC_compute.h` files are generated first.

## Known issue
This setup is able to reproduce a problem with renderscript support mode described [here](https://stackoverflow.com/q/50627520/15139).
As it is, call to renderscript will fail at runtime, since `renderscriptTargetApi` set as 24 does not generate `librs.compute.so`. It is generated if `renderscriptTargetApi` is 19 or 20 limiting us to older APIs.
