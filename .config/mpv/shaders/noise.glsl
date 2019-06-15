//!HOOK LUMA
//!HOOK RGB
//!BIND HOOKED

#define STRENGTH 256

// PRNG taken from mpv's deband shader
float mod289(float x)  { return x - floor(x / 289.0) * 289.0; }
float permute(float x) { return mod289((34.0*x + 1.0) * x); }
float rand(float x)    { return fract(x / 41.0); }

vec4 hook()  {
    vec3 _m = vec3(HOOKED_pos, random) + vec3(1.0);
    float h = permute(permute(permute(_m.x)+_m.y)+_m.z);

    return HOOKED_tex(HOOKED_pos) + vec4(STRENGTH/4096.0 * (rand(h) - 0.5));
}
