//!DESC grayscale
//!HOOK LINEAR
//!BIND HOOKED

vec4 hook()
{
    float luma = dot(HOOKED_texOff(0).rgb, vec3(0.2126, 0.7152, 0.0722));
    return vec4(vec3(luma), 1.0);
}
