#!/usr/bin/env python3

import os, subprocess, random, time

config = '.config/awesome/'
dir = config + 'src/assets/backgrounds/'
logdir = config + 'src/scripts/background.d.log'

refresh_rate_min = 1  # The refresh rate, in minutes
refresh_rate_sec = 0   # The refresh rate, in seconds

while True:
  os.remove(config + 'src/assets/background.png')
  subprocess.Popen(['cp', dir + random.SystemRandom().choice(os.listdir(dir)), config + 'src/assets/background.png'])
  time.sleep(refresh_rate_min*60 + refresh_rate_sec)