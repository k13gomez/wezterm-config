local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 18.0

config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

local blocked_actions = {
  SpawnTab = true,
  ActivateTab = true,
  ActivateTabRelative = true,
  MoveTabRelative = true,
  SpawnWindow = true,
  CloseCurrentTab = true,
}

config.keys = {}
if wezterm.gui then
  for _, key in ipairs(wezterm.gui.default_keys()) do
    local action = type(key.action) == 'table' and next(key.action) or key.action
    if blocked_actions[action] then
      table.insert(config.keys, {
        key = key.key,
        mods = key.mods,
        action = wezterm.action.DisableDefaultAssignment,
      })
    end
  end
end

wezterm.on('gui-startup', function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

return config
