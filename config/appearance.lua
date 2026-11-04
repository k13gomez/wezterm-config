local wezterm = require 'wezterm'

local M = {}

-- Written by the Neovim and Emacs style pickers; see ~/.byobu/tokyonight.tmux for tmux.
local style_file = wezterm.home_dir .. '/.local/state/tokyonight/style'

local schemes = {
  night = 'Tokyo Night',
  storm = 'Tokyo Night Storm',
  moon = 'Tokyo Night Moon',
  day = 'Tokyo Night Day',
}

local function color_scheme()
  local file = io.open(style_file)
  local style = file and file:read('l')
  if file then
    file:close()
  end
  return schemes[style] or schemes.night
end

function M.apply_to_config(config)
  wezterm.add_to_config_reload_watch_list(style_file)

  config.font = wezterm.font 'JetBrainsMono Nerd Font'
  config.font_size = 18.0
  config.color_scheme = color_scheme()

  config.window_background_opacity = 0.80
  config.macos_window_background_blur = 20
  config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

  config.enable_tab_bar = false
end

return M
