----------------------------------------------------------------
-- This class is to output an error if you fuck up the config --
----------------------------------------------------------------
-- Awesome Libs
local naughty = require("naughty")
local gears = require("gears")
local color = require("src.theme.colors")
local awful = require("awful")

local err_icon = awful.util.getdir("config") .. "src/assets/icons/network/no-internet.svg"

do
  local in_error = false
  awesome.connect_signal(
    "debug::error",
    function(err)
    if in_error then
      return
    end
    in_error = true

    naughty.notify({
      --preset = naughty.config.presets.critical,
      app_name = "System",
      title = "Error",
      icon = gears.color.recolor_image(err_icon, color['Red400']),
      text = tostring(err)
    })
    in_error = false
  end
  )
end

