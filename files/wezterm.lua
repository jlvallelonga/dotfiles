local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400 * 7 -- once per week

return config
