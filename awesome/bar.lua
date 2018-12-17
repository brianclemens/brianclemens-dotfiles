-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
local lain = require("lain")

-- Load and initialize theme handling library
local beautiful = require("beautiful")
beautiful.init("/home/oda/.config/awesome/theme.lua")
local dpi = beautiful.xresources.apply_dpi

-- Notification library
local naughty = require("naughty")

local markup = lain.util.markup

-- {{{ Music player daemon
local mpd_prefix = wibox.widget {
    image = beautiful.icon_media_player,
    forced_width = beautiful.bar_icon_size,
    widget = wibox.widget.imagebox
}

mpd_widget = lain.widget.mpd {
    default_art = "/home/oda/.config/awesome/icons/default_album.png",
    music_dir = "/home/oda/music",
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            widget:set_markup(markup.font(beautiful.font, markup("#FF8466", artist) .. " " .. title))
            mpd_prefix:set_image(beautiful.icon_media_player)
        elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(beautiful.font, " mpd paused "))
            mpd_prefix:set_image(beautiful.icon_media_player)
        else
            widget:set_text("")
            mpd_prefix:set_image()
        end
    end
}
-- }}}

-- {{{ Clock and calendar
local clock_prefix = wibox.widget {
    image = beautiful.icon_clock,
    forced_width = beautiful.bar_icon_size,
    widget = wibox.widget.imagebox
}

local clock_widget = wibox.widget.textclock("%H:%M")

local calendar_popup = awful.widget.calendar_popup.month{
    font = beautiful.font
}
calendar_popup:attach(clock_widget, "tc")
-- }}}

-- {{{ Wifi
local wifi_prefix = wibox.widget {
    image = beautiful.icon_wifi_disconnect,
    forced_width = beautiful.bar_icon_size,
    widget = wibox.widget.imagebox
}
-- }}}

-- {{{ Volume
local volume_prefix = wibox.widget {
    image = beautiful.icon_volume_medium,
    forced_width = beautiful.bar_icon_size,
    widget = wibox.widget.imagebox
}

volume_widget = lain.widget.alsa {
    settings = function()
        vol_text = volume_now.level
        if volume_now.status == "off" then
            vol_text = "mute"
            volume_prefix:set_image(beautiful.icon_volume_mute)
        elseif tonumber(volume_now.level) < 25 then
            volume_prefix:set_image(beautiful.icon_volume_off)
        elseif tonumber(volume_now.level) < 50 then
            volume_prefix:set_image(beautiful.icon_volume_low)
        elseif tonumber(volume_now.level) < 75 then
            volume_prefix:set_image(beautiful.icon_volume_medium)
        else
            volume_prefix:set_image(beautiful.icon_volume_high)
        end
        widget:set_markup(markup.fontfg(beautiful.font, beautiful.fg_normal, " " .. volume_now.level .. " "))
    end
}

volume_widget.widget:buttons(awful.util.table.join(
    awful.button({}, 1, function() -- Left click
        os.execute("amixer -q set Master toggle")
        volume_widget.update()
    end),
    awful.button({}, 3, function() -- Right click
        os.execute(string.format("%s set %s toggle", volume.cmd, volume.togglechannel or volume.channel))
        volume_widget.update()
    end),
    awful.button({}, 4, function() -- Scroll up
        os.execute("amixer -q set Master 1%+")
        volume_widget.update()
    end),
    awful.button({}, 5, function() -- Scroll down
        os.execute("amixer -q set Master 1%-")
        volume_widget.update()
    end)
))

volume_widget.update()
-- }}}

-- {{{ TODO what the fuck is this shit
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7" }, s, awful.layout.suit.tile)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

-- }}}

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        { -- Middle
            layout = wibox.layout.fixed.horizontal,
            wibox.container.place(clock_prefix),
            clock_widget,
        },
        { -- Right
            layout = wibox.layout.fixed.horizontal,
            wibox.container.place(mpd_prefix),
            mpd_widget,
            wibox.container.place(volume_prefix),
            volume_widget.widget,
            wibox.widget.systray(),
        },
    }
end)
