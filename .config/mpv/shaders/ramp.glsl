vec4 sample(sampler2D tex, vec2 pos, vec2 tex_size)
{
    return vec4(vec3(pow(pos.x, 2.2)), 1.0);
}
