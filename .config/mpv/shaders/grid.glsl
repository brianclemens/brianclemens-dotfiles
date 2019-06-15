vec4 sample_pixel(sampler2D tex, vec2 pos, vec2 tex_size)
{
    vec2 dir = fract(pos * tex_size / 2) - 0.5;

    return vec4(mix(0.0, 1.0, sign(dir.x) == sign(dir.y)));
}
