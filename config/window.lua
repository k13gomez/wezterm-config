local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.window_close_confirmation = 'NeverPrompt'

  wezterm.on('gui-startup', function(cmd)
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
  end)
end

return M
