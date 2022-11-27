-------------------------------------------
-- Uservariables are stored in this file --
-------------------------------------------
local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi
local home = os.getenv("HOME")

-- If you want different default programs, wallpaper path or modkey; edit this file.
user_vars = {
  -- Use a privacy respecting server, or the server owners will be able to know when the user logs in
  uptime_server = '127.0.0.1',

  -- Autotiling layouts
  layouts = {},

  -- Icon theme from /usr/share/icons
  icon_theme = "Papirus-Dark",

  -- Write the terminal command to start anything here
  autostart = {
    "xfce4-power-manager",
    "emote; killall emote; sleep 1; emote",
    --"xfdesktop --class=xfdesktop --name=xfdesktop",
    "light-locker --lock-on-suspend --lock-on-lid &",
    
    -- "xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 60.00 --output HDMI-1-3 --mode 1920x1080 --rate 60.00 --right-of HDMI-1",
    "picom",
    "nm-applet",
    ".config/awesome/src/scripts/background.d.py",
    ".config/awesome/src/scripts/onedrive.sh",
    ".config/awesome/src/scripts/laptop_config.sh"
  },

  -- Type 'ip a' and check your wlan and ethernet name
  network = {
    wlan = "wlp2s0",
    ethernet = "enp0s25"
  },

  -- Set your font with this format:
  font = {
    regular = "JetBrainsMono Nerd Font, 12",
    bold = "JetBrainsMono Nerd Font, bold 12",
    extrabold = "JetBrainsMono Nerd Font, ExtraBold 12",
    specify = "JetBrainsMono Nerd Font"
  },

  -- This is your default Terminal
  terminal = "lxterminal",

  -- This is the modkey 'mod4' = Super/Mod/WindowsKey, 'mod3' = alt...
  modkey = "Mod4",

  -- place your wallpaper at this path with this name, you could also try to change the path
  wallpaper = home .. "/.config/awesome/src/assets/background.png",

  -- Naming scheme for the powermenu, userhost = "user@hostname", fullname = "Firstname Surname", something else ...
  namestyle = "fullname",

  -- List every Keyboard layout you use here comma seperated. (run localectl list-keymaps to list all averiable keymaps)
  kblayout = { "en" },

  -- Your filemanager that opens with super+e
  file_manager = "thunar",

  -- Screenshot program to make a screenshot when print is hit
  screenshot_program = "flameshot gui",

  -- If you use the dock here is how you control its size
  dock_icon_size = 29,
  
  -- Show (true) or hide (false) the CPU Frequency on the CPU widget on the status bar
  cpu_freq = true,

  -- Add your programs exactly like in this example.
  -- First entry has to be how you would start the program in the terminal (just try it if you dont know yahoo it)
  -- Second can be what ever the fuck you want it to be (will be the displayed name if you hover over it)
  -- For steam games please use this format (look in .local/share/applications for the .desktop file, that will contain the number you need)
  -- {"394360", "Name", true} true will tell the func that it's a steam game
  -- Use xprop | grep WM_CLASS and use the *SECOND* string
  -- { WM_CLASS, program, name, user_icon, isSteam }
  dock_programs = {
    { "LXTerminal", "lxterminal", "LXTerminal" },
    { "waterfox", "/home/froggo/.waterfox/waterfox", "Waterfox" },
    { "Steam", "steam", "Steam" },
    { "PCManFM", "pcmanfm", "Files", "/usr/share/icons/Papirus-Dark/24x24/apps/dde-file-manager.svg" },
    { "LMMS", "lmms", "LMMS" },
    { "Audacity", "audacity", "Audacity" },
    { "Godot", "steam steam://rungameid/404790", "Godot", '/usr/share/icons/Papirus-Dark/24x24/apps/steam_icon_404790.svg'}
   }
}

