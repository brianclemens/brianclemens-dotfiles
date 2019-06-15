const vec3 bt709 = vec3(0.2126, 0.7152, 0.0722);

vec4 sample_pixel(sampler2D tex, vec2 pos, vec2 size) {
    vec4 color = texture(tex, pos);

    float luma = dot(bt709, color.rgb);
    color.rgb += vec3(luma*2 - luma);

    return color;
}
