vec4 sample(sampler2D tex, vec2 pos, vec2 tex_size)
{
    return texture(tex, pos).grba;
}
