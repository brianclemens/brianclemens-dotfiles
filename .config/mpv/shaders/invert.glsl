vec4 sample(sampler2D tex, vec2 pos, vec2 tex_size)
{
    vec4 color = texture(tex, pos);
    return vec4(1.0 - color.rgb, color.a);
}
