------------------------------
-- This is the clock widget --
------------------------------

-- Awesome Libs
local awful = require("awful")
local color = require("src.theme.colors")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")
require("src.core.signals")

-- Icon directory path
--local icondir = awful.util.getdir("config") .. "src/assets/icons/clock/"

-- Returns the clock widget
return function()

  local clock_widget = wibox.widget {
    {
      {
        {
          id = "label",
          align = "center",
          valign = "center",
          format = "%H:%M",
          widget = wibox.widget.textclock
        },
        id = "clock_layout",
        layout = wibox.layout.fixed.horizontal
      },
      id = "container",
      left = dpi(8),
      right = dpi(8),
      widget = wibox.container.margin
    },
    bg = color["Clear"],
    fg = color["White"],
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }

  Hover_signal(clock_widget, '#1e1e1edd', color["White"])

  return clock_widget
end
