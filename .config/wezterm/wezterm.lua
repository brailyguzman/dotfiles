-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- Apply the Catppuccin Mocha color scheme
config.color_scheme = "Catppuccin Mocha"

-- Override the background color
config.colors = {
	background = "#020616",
}

-- Configure font and font size
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16.0
config.line_height = 1.2

config.cell_width = 1.0

-- Disable tabs for a minimal look
config.enable_tab_bar = false

config.native_macos_fullscreen_mode = true

-- Enable a blurred background (only works on macOS)
config.macos_window_background_blur = 25

-- Make the background slightly transparent
config.window_background_opacity = 0.95

-- Adjust padding for a balanced layout similar to iTerm2
config.window_padding = {
	left = 8,
	right = 8,
	top = 4,
	bottom = 4,
}

-- Return the configuration to wezterm
return config
