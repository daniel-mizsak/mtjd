-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.initial_cols = 100
config.initial_rows = 34

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.macos_window_background_blur = 20
config.window_background_opacity = 0.95
config.window_close_confirmation = "NeverPrompt"

config.default_prog = { 'pwsh.exe' }

-- and finally, return the configuration to wezterm
return config
