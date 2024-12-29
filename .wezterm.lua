local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action
config.font = wezterm.font 'Hurmit Nerd Font'
config.font_size = 16.0

config.color_scheme = 'Monokai Remastered'
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.default_prog = { 'fish' }
config.window_background_opacity = 0.85
config.scrollback_lines = 3500
config.use_fancy_tab_bar = false

config.adjust_window_size_when_changing_font_size = false
config.command_palette_font_size = 18.0
config.command_palette_bg_color = '#000000'
config.default_cursor_style = 'SteadyBar'

config.keys = {
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = act.SplitPane {
            direction = 'Right',
            size = { Percent = 50 }
        }
    },
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = act.SplitPane {
            direction = 'Left',
            size = { Percent = 50 }
        }
    },
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = act.SplitPane {
            direction = 'Up',
            size = { Percent = 50 }
        }
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = act.SplitPane {
            direction = 'Down',
            size = { Percent = 50 }
        }
    },
    {
        key = 'w',
        mods = 'CTRL|SHIFT',
        action = act.CloseCurrentPane { confirm = false }
    },
    {
        key = 'LeftArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'ALT',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Right', 5 },
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Up', 5 },
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Down', 5 },
    },
    {
        key = 'o',
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor
    },
    {
        key = 'r',
        mods = 'CTRL|SHIFT',
        action = act.RotatePanes 'Clockwise'
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|ALT',
        action = act.ScrollByLine(-1)
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|ALT',
        action = act.ScrollByLine(1)
    },
    {
        key = '/',
        mods = 'CTRL',
        action = act.Search { CaseInSensitiveString = '' },
    },
    {
        key = 'z',
        mods = 'CTRL|SHIFT',
        action = act.TogglePaneZoomState,
    }
}

config.unix_domains = {
    {
        name = 'unix',
    },
}

for i = 1, 8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i - 1),
    })
end

config.colors = {
    background = '#000000',
    split = '#444444',

    tab_bar = {
        background = '#1a1a1a',

        active_tab = {
            bg_color = '#000000',
            fg_color = '#ffffff',
            intensity = 'Normal'
        },

        inactive_tab = {
            bg_color = '#1a1a1a',
            fg_color = '#888888',
            intensity = 'Half'
        },

        new_tab = {
            bg_color = '#1a1a1a',
            fg_color = '#808080',
        },
    }
}

config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 0.9,
}

-- Enable for unix domain sockets
-- config.default_gui_startup_args = { 'connect', 'unix' }

return config
