import os

config_dir = '~/.config/'

def set_pfp(f=config_dir+"awesome/assets/pfp.png"):
  os.remove(config_dir+'awesome/assets/pfp.png')

# Get pfp dir:
# sudo cat /var/lib/AccountsService/users/$(whoami) | grep Icon= | awk '{print $1}' | cut -d '=' -f 2
