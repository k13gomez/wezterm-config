local wezterm = require 'wezterm'

local M = {}

local blocked_actions = {
  SpawnTab = true,
  ActivateTab = true,
  ActivateTabRelative = true,
  MoveTabRelative = true,
  SpawnWindow = true,
  CloseCurrentTab = true,
}

function M.apply_to_config(config)
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
end

return M
