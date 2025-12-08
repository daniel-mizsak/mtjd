-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14
config.max_fps = 120

config.initial_cols = 100
config.initial_rows = 34

config.animation_fps = 120
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 600
config.default_cursor_style = "BlinkingBar"

-- Position window on left half of screen
-- https://github.com/wezterm/wezterm/discussions/2506
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    local gui_window = window:gui_window()
    local screen = wezterm.gui.screens().active
    local width = screen.width / 2
    local height = screen.height
    gui_window:set_position(0, 0)
    gui_window:set_inner_size(width, height)
end)

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.macos_window_background_blur = 20
config.window_background_opacity = 0.95
config.window_close_confirmation = "NeverPrompt"

config.keys = { -- Navigation
{
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action {
        SendString = "\x1bb"
    }
}, {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action {
        SendString = "\x1bf"
    }
}}
config.mouse_bindings = {{
    event = {
        Up = {
            streak = 1,
            button = "Left"
        }
    },
    mods = "NONE",
    action = wezterm.action_callback(function(window, pane)
        local has_selection = window:get_selection_text_for_pane(pane) ~= ""
        if has_selection then
            window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
            window:perform_action(act.ClearSelection, pane)
        end
    end)
}, {
    event = {
        Down = {
            streak = 1,
            button = "Middle"
        }
    },
    mods = "NONE",
    action = wezterm.action({
        PasteFrom = "Clipboard"
    })
}}

-- and finally, return the configuration to wezterm
return config
