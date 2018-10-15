local gears = require("gears")
local gfs = require("gears.filesystem")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")

local dpi = xresources.apply_dpi
local icon_path = os.getenv("HOME") .. "/.config/awesome/icons/"
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "Source Sans Pro 14"

theme.bg_normal = "#1d2021d8"
theme.fg_normal = "#f0f0f0d8"

theme.bg_focus = "#076678d8"
theme.fg_focus = "#ffffff"

theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_urgent     = "#ebdbb2"
theme.fg_minimize   = "#ebdbb2"

theme.useless_gap   = dpi(12)

theme.border_radius = dpi(12)
theme.border_width  = dpi(0)

-- {{{ calendar widget
theme.calendar_focus_bg_color = "#00000000"
theme.calendar_focus_border_width = 2
theme.calendar_focus_shape = function(cr,w,h)
                gears.shape.rounded_rect(cr,w,h,dpi(5))
            end
theme.calendar_focus_markup = function(t) return '<b>' .. t .. '</b>' end
theme.calendar_header_bg_color = "#00000000"
theme.calendar_header_markup = function(t) return '<b>' .. t .. '</b>' end
theme.calendar_month_bg_color = "#00000000"
theme.calendar_month_padding = "20"
theme.calendar_normal_bg_color = "#00000000"
theme.calendar_normal_padding = 3
theme.calendar_weekday_bg_color = "#00000000"
theme.calendar_weekday_markup = function(t) return '<i>' .. t .. '</i>' end
-- }}}

-- {{{ hotkey cheat sheet
theme.hotkeys_description_font = "Source Sans Pro 16"
theme.hotkeys_font = "Source Code Pro 16"
theme.hotkeys_group_margin = dpi(12)
theme.hotkeys_label_bg = "#8ec07cd8"
theme.hotkeys_modifiers_fg = "#8ec07cd8"
theme.hotkeys_shape = function(cr,w,h)
    gears.shape.rounded_rect(cr,w,h,theme.border_radius)
end
-- }}}

-- There are other variable sets overriding the default one when defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- {{{ notifications
-- theme.notification_border_color = "#1d2021d8"
theme.notification_font = "Source Sans Pro 18"
theme.notification_margin = dpi(20)
theme.notification_shape = function(cr,w,h)
    gears.shape.rounded_rect(cr,w,h,theme.border_radius)
end
theme.notification_width = dpi(500)
-- }}}

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- {{{ titlebars
theme.titlebar_bg_focus = ({ type = "linear",
                             from = { 0, 0 },
                             to = { 0, 50 },
                             stops = { { 0, "#665c54" },
                                       { 1, "#1d2021" }
                                     }
                           })

theme.titlebar_fg_focus = ({ type = "linear",
                             from = { 0, 0 },
                             to = { 0, 50 },
                             stops = { { 0, "#fbf1c7" },
                                       { 1, "#bdae93" }
                                     }
                           })

theme.titlebar_bg_normal = ({ type = "linear",
                             from = { 0, 0 },
                             to = { 0, 50 },
                             stops = { { 0, "#504945" },
                                       { 1, "#1d2021" }
                                     }
                           })

theme.titlebar_fg_normal = ({ type = "linear",
                             from = { 0, 0 },
                             to = { 0, 50 },
                             stops = { { 0, "#d5c4a1" },
                                       { 1, "#928374" }
                                     }
                           })

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

theme.wallpaper = "/home/oda/.config/wallpaper/oyama.jpg"

-- {{{ layout icons
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"
-- }}}

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.icon_theme = "Paper"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
