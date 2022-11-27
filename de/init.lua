--------------------------------------------------------------------------------------------------------------
-- This is the statusbar, every widget, module and so on is combined to all the stuff you see on the screen --
--------------------------------------------------------------------------------------------------------------
-- Awesome Libs
local awful = require("awful")
-- local freedesktop = require("freedesktop")

awful.screen.connect_for_each_screen(
-- For each screen this function is called once
-- If you want to change the modules per screen use the indices
-- e.g. 1 would be the primary screen and 2 the secondary screen.
  function(s)
  -- Create 9 tags
  awful.layout.layouts = user_vars.layouts
  awful.tag(
    { "1" },
    s,
    user_vars.layouts[1]
  )

  -- freedesktop.desktop.add_icons({screen = s, icon_theme = "Papirus-Dark", baseicons = {[1] = {label = "Trash", icon = "user-trash", onclick = "trash://"}}})

  require("src.modules.powermenu")(s)
  -- TODO: rewrite calendar osd, maybe write an own inplementation
  -- require("src.modules.calendar_osd")(s)
  require("src.modules.volume_osd")(s)
  require("src.modules.brightness_osd")(s)
  require("src.modules.titlebar")
  require("src.modules.volume_controller")(s)

  -- Widgets
  s.battery = require("src.widgets.battery")()
  s.audio = require("src.widgets.audio")(s)
  s.date = require("src.widgets.date")()
  s.time = require("src.widgets.clock")()
  s.bluetooth = require("src.widgets.bluetooth")()
  s.layoutlist = require("src.widgets.layout_list")()
  s.powerbutton = require("src.widgets.power")()
  s.kblayout = require("src.widgets.kblayout")(s)
  s.taglist = require("src.widgets.taglist")(s)
  s.tasklist = require("src.widgets.tasklist")(s)
  s.cpu_freq = require("src.widgets.cpu_info")("freq", "average")
  s.ram_info = require("src.widgets.ram_info")()
  s.network = require("src.widgets.network")()
  s.systray = require("src.widgets.systray")(s)
  s.cpu_usage = require("src.widgets.cpu_info")("usage")
  s.gpu_usage = require("src.widgets.gpu_info")("usage")
  s.battery = require("src.widgets.battery")()
  s.control_center = require("src.widgets.control_center")()
  
  require("de.systray")(s, { s.systray, s.time })
  require("de.tasklist")(s, { s.tasklist })
  require("de.status")(s, { s.ram_info, s.cpu_usage, s.bluetooth, s.network, s.audio, s.battery, s.powerbutton })
  require("de.dock")(s, user_vars.dock_programs) -- , { s.tasklist }) -- TODO

   -- require('de.desktop')()
end
)
