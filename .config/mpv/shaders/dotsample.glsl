vec4 sample_pixel(sampler2D tex, vec2 pos, vec2 size)
{
    vec2 base = (round(pos * size - vec2(0.5)) + vec2(0.5)) / size;

    if (length(size * (pos - base)) < 0.4) {
        return texture(tex, base);
    } else {
        return vec4(0);
    }
}
