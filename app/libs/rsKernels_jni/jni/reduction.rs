#pragma version(1)
#pragma rs java_package_name(com.example.renderscript)
#pragma rs_fp_relaxed

#pragma rs reduce(addfloat) accumulator(addfloatAccum)

static void addfloatAccum(float *accum, float val) {
    *accum += val;
}

