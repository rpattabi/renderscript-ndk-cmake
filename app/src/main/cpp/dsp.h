#ifndef RENDERSCRIPT_DSP_H
#define RENDERSCRIPT_DSP_H


class Dsp {
private:
    const char *appCacheDir;

public:
    Dsp(const char *app_cache_dir) {
        appCacheDir = app_cache_dir;
    }

    void call_rs();

};


#endif //RENDERSCRIPT_DSP_H
