# WezTerm config

My WezTerm setup. It's meant to sit under byobu/tmux, so WezTerm handles fonts,
colors and the window while tmux handles tabs and splits.

## Layout

- `wezterm.lua` builds the config and applies each module in `config/`.
- `config/appearance.lua` sets the font (JetBrainsMono Nerd Font, 18pt), padding,
  hides the tab bar, and picks the Tokyo Night color scheme.
- `config/keys.lua` disables the default tab and window keybindings
  (spawn, switch, move, close tab; new window).
- `config/window.lua` starts fullscreen and closes without a confirmation prompt.

## Theme sync

The color scheme follows the Tokyo Night style chosen in Neovim or Emacs. Their
style pickers write `night`, `storm`, `moon` or `day` to
`~/.local/state/tokyonight/style`; WezTerm reads that file and reloads when it
changes. A missing or unknown value falls back to `night`.

## Requirements

- WezTerm
- JetBrainsMono Nerd Font
