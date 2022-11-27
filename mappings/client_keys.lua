-- Awesome Libs
local awful = require("awful")
local gears = require("gears")

local modkey = user_vars.modkey

return gears.table.join(
  awful.key(
    { modkey },
    "#122",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "Toggle fullscreen", group = "Window" }
  ),
  awful.key(
    { "Mod1" },
    "#115",
    function(c)
      c:kill()
    end,
    { description = "Close window", group = "Window" }
  ),
  awful.key(
    { modkey },
    "q",
    function(c)
      c:kill()
    end,
    { description = "Close window", group = "Window" }
  ),
  awful.key(
    { modkey },
    "=",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "Un/Maximize", group = "Window" }
  ),
  awful.key(
    { modkey },
    "-",
    function(c)
      if c == client.focus then
        c.minimized = true
      else
        c.minimized = false
        if not c:isvisible() and c.first_tag then
          c.first_tag:view_only()
        end
        c:emit_signal('request::activate')
        c:raise()
      end
    end,
    { description = "Un/Minimize", group = "Window" }
  )
)
