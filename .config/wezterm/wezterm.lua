local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa Dragon (Gogh)"

config.font = wezterm.font("JetBrains Mono Nerd Font")
-- config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 11.5

config.enable_tab_bar = false

config.window_background_opacity = 0.92

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.initial_cols = 97
config.initial_rows = 25

config.enable_wayland = true
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false

return config
