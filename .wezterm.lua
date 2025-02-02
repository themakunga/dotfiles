-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme

config.font = wezterm.font("Hack")
config.font_size = 14
config.color_scheme = "Tokyo Night Storm"

config.window_background_opacity = 1
config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
