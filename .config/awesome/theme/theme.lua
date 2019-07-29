local config_dir = os.getenv("HOME") .. "/.config/awesome"
local theme_path = config_dir .. "/theme/"
local icon_path = theme_path .. "icons/"

local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

local theme = {}

-- {{{ Colors
theme.color = {}
theme.color.red         = "#cc241d"
theme.color.green       = "#98971a"
theme.color.yellow      = "#d79921"
theme.color.blue        = "#458588"
theme.color.purple      = "#b16286"
theme.color.aqua        = "#689d6a"
theme.color.orange      = "#d65d0e"
theme.color.gray        = "#928374"

theme.color.lightred    = "#fb4934"
theme.color.lightgreen  = "#b8bb26"
theme.color.lightyellow = "#fabd2f"
theme.color.lightblue   = "#83a598"
theme.color.lightpurple = "#d3869b"
theme.color.lightaqua   = "#8ec07c"
theme.color.lightorange = "#fe8019"
theme.color.lightgray   = "#a89984"

theme.color.darkred     = "#960006"
theme.color.darkgreen   = "#79740e"
theme.color.darkyellow  = "#b57614"
theme.color.darkblue    = "#076678"
theme.color.darkpurple  = "#8f3f71"
theme.color.darkaqua    = "#427b58"
theme.color.darkorange  = "#af3a03"
theme.color.darkgray    = "#7c6f64"

theme.color.bg1      = "#3c3836"
theme.color.bg2      = "#504945"
theme.color.bg3      = "#665c54"
theme.color.bg4      = "#7c6f64"

theme.color.fg1      = "#ebdbb2"
theme.color.fg2      = "#d5c4a1"
theme.color.fg3      = "#bdae93"
theme.color.fg4      = "#a89984"

theme.color.bg      = "#282828"
theme.color.lightbg = "#32302f"
theme.color.darkbg  = "#1d2021"

theme.color.fg      = "#ebdbb2"
theme.color.lightfg = "#fbf1c7"
theme.color.darkfg  = "#f2e5bc"
-- }}}

-- {{{ Font
theme.font = "Fira Sans Condensed Medium 16"
theme.mono_font = "Operator Mono Book 16"
theme.font_height = beautiful.get_font_height(theme.font)
theme.bar_height = beautiful.get_font_height(theme.font)*1.3
-- }}}

-- {{{ Bar
theme.bar_icon_size = dpi(25)

-- Normal
theme.bg_normal = theme.color.bg
theme.fg_normal = theme.color.fg

-- Focus
theme.fg_focus = theme.color.lightfg
theme.bg_focus = theme.bg_normal

-- Minimize
theme.fg_minimize = theme.color.gray
theme.bg_minimize = theme.bg_normal

-- Urgent
theme.fg_urgent = theme.color.orange
theme.bg_urgent = theme.bg_normal
-- }}}

-- {{{ Borders / gap
theme.border_width = 0
theme.border_radius = dpi(8)
theme.useless_gap = dpi(12)
-- }}}

-- {{{ Hotkeys
theme.hotkeys_font = theme.mono_font
theme.hotkeys_description_font = theme.font
theme.hotkeys_bg = "#1d2021d8"
theme.hotkeys_border_width = dpi(4)
theme.hotkeys_modifiers_fg = "#8ec07c"
theme.hotkeys_shape = function(cr,w,h)
    gears.shape.rounded_rect(cr,w,h,theme.border_radius)
end
-- }}}

-- {{{ Icons
theme.icon = {}

-- Battery
theme.icon.bat_missing          = icon_path .. "battery-missing.svg"
theme.icon.bat_empty            = icon_path .. "battery-empty.svg"
theme.icon.bat_empty_charging   = icon_path .. "battery-empty-charging.svg"
theme.icon.bat_low              = icon_path .. "battery-low.svg"
theme.icon.bat_low_charging     = icon_path .. "battery-low-charging.svg"
theme.icon.bat_medium           = icon_path .. "battery-medium.svg"
theme.icon.bat_medium_charging  = icon_path .. "battery-medium-charging.svg"
theme.icon.bat_good             = icon_path .. "battery-good.svg"
theme.icon.bat_good_charging    = icon_path .. "battery-good-charging.svg"
theme.icon.bat_full             = icon_path .. "battery-full.svg"
theme.icon.bat_full_charging    = icon_path .. "battery-full-charged.svg"

-- Wired network
theme.icon.wired            = icon_path .. "network-wired.svg"
theme.icon.wired_offline    = icon_path .. "network-wired-offline.svg"

-- MPD
theme.icon.mpd_default        = icon_path .. "default-album-art.svg"
theme.icon.mpd_pause          = icon_path .. "mpd-pause.svg"
theme.icon.mpd_play           = icon_path .. "mpd-play.svg"
theme.icon.mpd_stop           = icon_path .. "mpd-stop.svg"

-- Volume
theme.icon.volume_over      = icon_path .. "audio-volume-overamplified.svg"
theme.icon.volume_high      = icon_path .. "audio-volume-high.svg"
theme.icon.volume_med       = icon_path .. "audio-volume-medium.svg"
theme.icon.volume_low       = icon_path .. "audio-volume-low.svg"
theme.icon.volume_mute      = icon_path .. "audio-volume-muted.svg"
theme.icon.volume_muteblock = icon_path .. "audio-volume-muted-blocking.svg"

-- VPN
theme.icon.vpn              = icon_path .. "network-vpn.svg"
theme.icon.vpn_acquiring    = icon_path .. "network-vpn-acquiring.svg"

-- Wireless network
theme.icon.wireless_excellent   = icon_path .. "network-wireless-signal-excellent.svg"
theme.icon.wireless_good        = icon_path .. "network-wireless-signal-good.svg"
theme.icon.wireless_ok          = icon_path .. "network-wireless-signal-ok.svg"
theme.icon.wireless_low         = icon_path .. "network-wireless-signal-low.svg"
theme.icon.wireless_none        = icon_path .. "network-wireless-signal-none.svg"
theme.icon.wireless_acquiring   = icon_path .. "network-wireless-acquiring.svg"
theme.icon.wireless_offline     = icon_path .. "network-wireless-offline.svg"
-- }}}

-- {{{ Layout
theme.layout_fairh      = icon_path .. "layouts/fairhw.png"
theme.layout_fairv      = icon_path .. "layouts/fairvw.png"
theme.layout_floating   = icon_path .. "layouts/floatingw.png"
theme.layout_magnifier  = icon_path .. "layouts/magnifierw.png"
theme.layout_max        = icon_path .. "layouts/maxw.png"
theme.layout_fullscreen = icon_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = icon_path .. "layouts/tilebottomw.png"
theme.layout_tileleft   = icon_path .. "layouts/tileleftw.png"
theme.layout_tile       = icon_path .. "layouts/tilew.png"
theme.layout_tiletop    = icon_path .. "layouts/tiletopw.png"
theme.layout_spiral     = icon_path .. "layouts/spiralw.png"
theme.layout_dwindle    = icon_path .. "layouts/dwindlew.png"
theme.layout_cornernw   = icon_path .. "layouts/cornernww.png"
theme.layout_cornerne   = icon_path .. "layouts/cornernew.png"
theme.layout_cornersw   = icon_path .. "layouts/cornersww.png"
theme.layout_cornerse   = icon_path .. "layouts/cornersew.png"
-- }}}

-- {{{ Menu
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = theme.bar_height
theme.menu_width  = dpi(100)
theme.menu_border_width = dpi(1)
theme.menu_border_color = theme.color.gray
theme.menu_shape = function(cr, width, height)
    gears.shape.infobubble(cr, width, height, corner_radius, arrow_size, width - dpi(35))
end

theme.menu_bg_normal = theme.color.bg
theme.menu_fg_normal = theme.color.fg2

theme.menu_bg_focus = theme.color.bg1
theme.menu_fg_focus = theme.color.fg
-- }}}

-- {{{ Notifications
theme.notification_font = theme.font
theme.notification_bg = theme.color.bg1
theme.notification_fg = theme.color.fg2
theme.notification_border_color = theme.color.gray
theme.notification_border_width = dpi(2)
theme.notification_margin = dpi(10)
theme.notification_spacing = dpi(10)
theme.notification_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, theme.corner_radius)
end
-- }}}

-- {{{ Prompt
theme.prompt_font = theme.mono_font
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus = theme.color.fg
theme.taglist_fg_urgent = theme.color.orange
theme.taglist_fg_occupied = theme.color.gray
theme.taglist_fg_empty = theme.color.bg2
theme.taglist_fg_volatile = theme.color.red
-- }}}

-- {{{ Titlebars
theme.titlebar_height = theme.bar_height

theme.titlebar_bg_normal = ({ type = "linear",
    from = { 0, 0 },
    to = { 0, theme.titlebar_height },
    stops = { { 0, theme.color.bg2 },
        { 1, theme.color.bg1 }
    }
})

theme.titlebar_fg_normal = theme.color.fg2

theme.titlebar_bg_focus = ({ type = "linear",
    from = { 0, 0 },
    to = { 0, theme.titlebar_height },
    stops = { { 0, theme.color.bg3 },
        { 1, theme.color.bg1 }
    }
})

theme.titlebar_fg_focus = theme.color.fg

theme.titlebar_close_button_focus           = icon_path .. "tb_close_focus.svg"
theme.titlebar_close_button_focus_hover     = icon_path .. "tb_close_focus_hover.svg"
theme.titlebar_close_button_focus_press     = icon_path .. "tb_close_focus_press.svg"
theme.titlebar_close_button_normal          = icon_path .. "tb_close_normal.svg"
theme.titlebar_close_button_normal_hover    = icon_path .. "tb_close_normal_hover.svg"
theme.titlebar_close_button_normal_press    = icon_path .. "tb_close_normal_press.svg"

theme.titlebar_maximized_button_focus_active        = icon_path .. "tb_maximized_focus_active.svg"
theme.titlebar_maximized_button_focus_active_hover  = icon_path .. "tb_maximized_focus_active_hover.svg"
theme.titlebar_maximized_button_focus_active_press  = icon_path .. "tb_maximized_focus_active_press.svg"
theme.titlebar_maximized_button_normal_active       = icon_path .. "tb_maximized_normal_active.svg"
theme.titlebar_maximized_button_normal_active_hover = icon_path .. "tb_maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_normal_active_press = icon_path .. "tb_maximized_normal_active_press.svg"

theme.titlebar_maximized_button_focus_inactive          = icon_path .. "tb_maximized_focus_inactive.svg"
theme.titlebar_maximized_button_focus_inactive_hover    = icon_path .. "tb_maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_press    = icon_path .. "tb_maximized_focus_inactive_press.svg"
theme.titlebar_maximized_button_normal_inactive         = icon_path .. "tb_maximized_normal_inactive.svg"
theme.titlebar_maximized_button_normal_inactive_hover   = icon_path .. "tb_maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_normal_inactive_press   = icon_path .. "tb_maximized_normal_inactive_press.svg"

theme.titlebar_minimize_button_focus        = icon_path .. "tb_minimize_focus.svg"
theme.titlebar_minimize_button_focus_hover  = icon_path .. "tb_minimize_focus_hover.svg"
theme.titlebar_minimize_button_focus_press  = icon_path .. "tb_minimize_focus_press.svg"
theme.titlebar_minimize_button_normal       = icon_path .. "tb_minimize_normal.svg"
theme.titlebar_minimize_button_normal_hover = icon_path .. "tb_minimize_normal_hover.svg"
theme.titlebar_minimize_button_normal_press = icon_path .. "tb_minimize_normal_press.svg"
-- }}}

-- {{{ Tooltips
theme.tooltip_bg = theme.color.bg1
theme.tooltip_fg = theme.color.fg2
theme.tooltip_font = theme.font
theme.tooltip_border_color = theme.color.gray
theme.tooltip_border_width = dpi(2)
theme.panel_tooltip_shape = function(cr, width, height)
    gears.shape.infobubble(cr, width, height, corner_radius, arrow_size, width - dpi(35))
end

-- }}}

theme.wallpaper = theme_path .. "tweed.png"

theme.icon_theme = "gnome"

return theme
