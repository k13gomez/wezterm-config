local wezterm = require 'wezterm'
local config = wezterm.config_builder()

require('config.appearance').apply_to_config(config)
require('config.keys').apply_to_config(config)
require('config.window').apply_to_config(config)

return config
