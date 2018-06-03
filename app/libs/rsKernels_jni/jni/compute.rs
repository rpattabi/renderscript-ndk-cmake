#pragma version(1)
#pragma rs java_package_name(com.example.renderscript)
#pragma rs_fp_relaxed

float RS_KERNEL relay(float in, uint32_t x) {
    return in;
}
