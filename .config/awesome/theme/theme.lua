local config_dir = os.getenv("HOME") .. "/.config/awesome"
local theme_path = config_dir .. "/theme/"

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local theme = {}

-- {{{ Font
theme.font = "Source Sans Pro Display Medium 16"
theme.font_height = beautiful.get_font_height(theme.font)
theme.bar_height = beautiful.get_font_height(theme.font)*1.3
-- }}}

-- {{{ Bar
theme.bar_icon_size = dpi(25)

-- Normal
theme.fg_normal = "#ebdbb2"
theme.bg_normal = "#0d1011b0"

-- Focus
theme.fg_focus = "#fbf1c7"
theme.bg_focus = theme.bg_normal

-- Minimize
theme.fg_minimize = "#a89984"
theme.bg_minimize = theme.bg_normal

-- Urgent
theme.fg_urgent = "#cc241d"
theme.bg_urgent = theme.bg_normal
-- }}}

-- {{{ Borders / gap
theme.border_width = 0
theme.border_radius = dpi(8)
theme.useless_gap = dpi(12)
-- }}}

-- {{{ Layout
theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"
theme.layout_cornernw = "/usr/share/awesome/themes/default/layouts/cornernww.png"
theme.layout_cornerne = "/usr/share/awesome/themes/default/layouts/cornernew.png"
theme.layout_cornersw = "/usr/share/awesome/themes/default/layouts/cornersww.png"
theme.layout_cornerse = "/usr/share/awesome/themes/default/layouts/cornersew.png"
-- }}}

-- {{{ Menu
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = theme.bar_height
theme.menu_width  = 100
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus = "#fbf1c7"
theme.taglist_fg_urgent = "#d65d0e"
theme.taglist_fg_occupied = "#928374"
theme.taglist_fg_empty = "#3c3836"
theme.taglist_fg_volatile = "#cc241d"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_normal = ({ type = "linear",
    from = { 0, 0 },
    to = { 0, theme.bar_height },
    stops = { { 0, "#282828" },
        { 1, "#1d2021" }
    }
})


theme.titlebar_fg_normal = ({ type = "linear",
    from = { 0, 0 },
    to = { 0, theme.font_height },
    stops = { { 0, "#bdae93" },
        { 0.5, "#ebdbb2" },
        { 1, "#bdae93" }
    }
})

theme.titlebar_bg_focus = ({ type = "linear",
    from = { 0, 0 },
    to = { 0, theme.bar_height },
    stops = { { 0, "#3c3836" },
        { 1, "#282828" }
    }
})

theme.titlebar_fg_focus = ({ type = "linear",
    from = { 0, 0 },
    to = { 0, theme.font_height },
    stops = { { 0, "#ebdbb2" },
        { 0.5, "#fbf1c7" },
        { 1, "#ebdbb2" }
    }
})


theme.titlebar_close_button_focus           = theme_path .. "icons/tb_close_focus.svg"
theme.titlebar_close_button_focus_hover     = theme_path .. "icons/tb_close_focus_hover.svg"
theme.titlebar_close_button_focus_press     = theme_path .. "icons/tb_close_focus_press.svg"
theme.titlebar_close_button_normal          = theme_path .. "icons/tb_close_normal.svg"
theme.titlebar_close_button_normal_hover    = theme_path .. "icons/tb_close_normal_hover.svg"
theme.titlebar_close_button_normal_press    = theme_path .. "icons/tb_close_normal_press.svg"

theme.titlebar_maximized_button_focus_active        = theme_path .. "icons/tb_maximized_focus_active.svg"
theme.titlebar_maximized_button_focus_active_hover  = theme_path .. "icons/tb_maximized_focus_active_hover.svg"
theme.titlebar_maximized_button_focus_active_press  = theme_path .. "icons/tb_maximized_focus_active_press.svg"
theme.titlebar_maximized_button_normal_active       = theme_path .. "icons/tb_maximized_normal_active.svg"
theme.titlebar_maximized_button_normal_active_hover = theme_path .. "icons/tb_maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_normal_active_press = theme_path .. "icons/tb_maximized_normal_active_press.svg"

theme.titlebar_maximized_button_focus_inactive          = theme_path .. "icons/tb_maximized_focus_inactive.svg"
theme.titlebar_maximized_button_focus_inactive_hover    = theme_path .. "icons/tb_maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_press    = theme_path .. "icons/tb_maximized_focus_inactive_press.svg"
theme.titlebar_maximized_button_normal_inactive         = theme_path .. "icons/tb_maximized_normal_inactive.svg"
theme.titlebar_maximized_button_normal_inactive_hover   = theme_path .. "icons/tb_maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_normal_inactive_press   = theme_path .. "icons/tb_maximized_normal_inactive_press.svg"

theme.titlebar_minimize_button_focus        = theme_path .. "icons/tb_minimize_focus.svg"
theme.titlebar_minimize_button_focus_hover  = theme_path .. "icons/tb_minimize_focus_hover.svg"
theme.titlebar_minimize_button_focus_press  = theme_path .. "icons/tb_minimize_focus_press.svg"
theme.titlebar_minimize_button_normal       = theme_path .. "icons/tb_minimize_normal.svg"
theme.titlebar_minimize_button_normal_hover = theme_path .. "icons/tb_minimize_normal_hover.svg"
theme.titlebar_minimize_button_normal_press = theme_path .. "icons/tb_minimize_normal_press.svg"
-- }}}

theme.wallpaper = theme_path .. "wallpaper.png"

theme.icon_theme = "gnome"

return theme
