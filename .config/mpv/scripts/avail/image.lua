-- Allow changing a property with by zoom-adjusted amount
function zoom_invariant_add(prop, amt)
    amt = amt / 2 ^ mp.get_property_number("video-zoom")
    mp.set_property_number(prop, mp.get_property_number(prop) + amt)
end

-- Resets the pan if the entire image would be visible
function zoom_check_center()
    local zoom = mp.get_property_number("video-zoom")
    local rot = mp.get_property_number("video-rotate") * math.pi / 180
    local scaled = not mp.get_property_bool("video-unscaled")
    local dw = mp.get_property_number("dwidth") * 2 ^ zoom
    local dh = mp.get_property_number("dheight") * 2 ^ zoom

    -- Adjust for rotation
    local asr = math.abs(math.sin(rot)); acr = math.abs(math.cos(rot))
    dw, dh = dw*acr + dh*asr, dh*acr + dw*asr

    -- No property seems to exist for the actual window size, try this instead
    local ow = mp.get_property_number("osd-width")
    local oh = mp.get_property_number("osd-height")

    if (dw <= ow and dh <= oh) or (scaled and zoom <= 0.0) then
        mp.set_property_number("video-pan-x", 0)
        mp.set_property_number("video-pan-y", 0)
    end
end

-- Rotates the video while maintaining 0 <= prop < 360
function rotate_video(amt)
    local rot = mp.get_property_number("video-rotate")
    rot = (rot + amt) % 360
    mp.set_property_number("video-rotate", rot)
end

mp.add_key_binding(nil, "zoom-invariant-add", zoom_invariant_add)
mp.add_key_binding(nil, "zoom-check-center", zoom_check_center)
mp.add_key_binding(nil, "rotate-video", rotate_video)
