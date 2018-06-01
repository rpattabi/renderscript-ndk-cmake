#include "dsp.h"
#include <RenderScript.h>
#include <ScriptC_compute.h>

void Dsp::call_rs() {
    sp<RS> rs = new RS();
    rs->init(appCacheDir);

    ScriptC_compute* script = new ScriptC_compute(rs);

    sp<const Element> e = Element::F32(rs);
    sp<const Type> t = Type::create(rs, e, 10, 0, 0);
    sp<Allocation> inAlloc = Allocation::createTyped(rs, t);
    sp<Allocation> outAlloc = Allocation::createTyped(rs, t);

    script->forEach_relay(inAlloc, outAlloc);
}
