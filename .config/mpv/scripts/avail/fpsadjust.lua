require 'mp.options'
local opt = {
    maxiters = 5,      -- Frames involving at most this many frames will be
                       -- considered acceptable.

    maxdelta = 0.01,   -- Maximum allowed speed change (setting this too high
                       -- could cause noticeable change in pitch and tempo)

    mindelta = 0.0005, -- Minimum speed change that would be considered
                       -- significant enough to be worth calculating. Any lower
                       -- and it will just play at 100% speed to preserve CPU
                       -- cycles.
}
read_options(opt)

function get_scale(ratio, factor)
    scale = ratio * factor / math.floor(ratio * factor + 0.5)
    delta = math.abs(scale - 1)

    if (delta < opt.mindelta) then
        return 1   -- close enough, just use it
    end
    if (delta > opt.maxdelta) then
        return nil -- large deviation, skip
    end
    return scale   -- decent match found
end

function adjust_speed(event)
    clip_fps = mp.get_property_number("fps")
    disp_fps = mp.get_property_number("display-fps")

    if not clip_fps or not disp_fps or disp_fps == 0 then
        return
    end

    for i=1,opt.maxiters do
        scale = get_scale(disp_fps / clip_fps, i)
        if scale then
            break
        end
    end

    if scale then
        mp.set_property("speed", scale)
        print("Setting speed to", scale)
    end
end

mp.register_event("playback-restart", adjust_speed)
