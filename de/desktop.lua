-----------------------------
-- Add desktop icons, etc. --
-----------------------------

-- Awesome libs
local awful = require("awful")
local color = require("src.theme.colors")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")

local icon_dir = awful.util.getdir("config") .. "src/assets/icons/cpu/"

local desktop_func = function()
  local desktop_icon = wibox.widget {
    {
      {
        id = "icon",
        widget = wibox.widget.imagebox,
        image = icon_dir .. "cpu.svg",
        resize = true
      },
      spacing = dpi(10),
      {
        id = "label",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
      }
    },
    bg = "#00000000",
    fg = color["Grey900"],
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, 5)
    end,
    widget = wibox.container.background
  }
  
  watch(
    [[ bash -c "ls ~/Desktop" ]],
    3,
    function(_, stdout)
      naughty.notification {
      app_name = "System Notification",
      title    = "A notification 3",
      message  = "This is very informative and overflowing",
      icon     = "/home/crylia/.config/awesome/src/assets/userpfp/crylia.png",
      urgency  = "normal",
      timeout  = 1,
      actions  = {
        naughty.action {
          name = "Accept",
        },
        naughty.action {
          name = "Refuse",
        },
        naughty.action {
          name = "Ignore",
        },
      }
    }
    end
  )  
end

--desktop_func()

return desktop_func

