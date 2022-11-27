local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local bling = require("modules.bling")

Theme_path = awful.util.getdir("config") .. "/src/theme/"
Theme = {}

dofile(Theme_path .. "theme_variables.lua")

Theme.awesome_icon = Theme_path .. "../assets/icons/ArchLogo.png"
Theme.awesome_subicon = Theme_path .. "../assets/icons/ArchLogo.png"

-- Wallpaper
beautiful.wallpaper = user_vars.wallpaper
screen.connect_signal(
  'request::wallpaper',
  function(s)
  if beautiful.wallpaper then
    if type(beautiful.wallpaper) == 'string' then
      gears.wallpaper.maximized(beautiful.wallpaper, s)
    else
      beautiful.wallpaper(s)
    end
  end
end
)

beautiful.init(Theme)

bling.widget.window_switcher.enable {
  type = "thumbnail",

  hide_window_switcher_key = "Escape",
  cycle_key = "Tab",
  previous_key = "Left",
  next_key = "Right",

  cycleClientsByIdx = awful.client.focus.byidx,
  filterClients = awful.widget.tasklist.filter.currenttags
}