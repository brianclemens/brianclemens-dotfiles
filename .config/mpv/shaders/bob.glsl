// Naive bob deinterlacing, simply alternates

vec4 sample(sampler2D tex, vec2 pos, vec2 tex_size)
{
    float height = tex_size.y / 2;
    float ybase = (floor(pos.y * height - 0.25) + 0.25) / height;
    float yoff = (frame % 2) / tex_size.y;

    return cmul * texture(tex, vec2(pos.x, ybase + yoff));
}
