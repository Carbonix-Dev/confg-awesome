configs = [
  {
    'name': 'HDMI-0',
    'primary': True,
    'res': '1920x1080',
    'framerate': 60
  },
  {
    'name': 'HDMI-1-3',
    'primary': False,
    'res': '1920x1080',
    'framerate': 60
  }
]

import subprocess

def awk(text, index):
  return subprocess.Popen(['bash', '-c', "echo '%s' | awk '{ print $%s }'" % (text, str(index))], stdout=subprocess.PIPE).stdout.read().decode()[:-1]

def get_monitors():
  m_names = subprocess.Popen(["bash", "-c", "xrandr --listmonitors | awk '{ print $4 }'"], stdout=subprocess.PIPE).stdout.read()[1:][:-1].decode().split('\n')
  m_res_preproc = subprocess.Popen(["bash", "-c", "xrandr --listmonitors | awk '{ print $3 }'"], stdout=subprocess.PIPE).stdout.read()[1:][:-1].decode().split('\n')
  m_res = []
  for i in range(0, len(m_res_preproc)):
    res = m_res_preproc[i].split('+')[0].split('x')
    x_max, x_min = res[0].split('/')
    y_max, y_min = res[1].split('/')
    
    xrandout = subprocess.Popen(['xrandr'], stdout=subprocess.PIPE).stdout.read().decode().split('\n')
    searching = True
    modes = {}
    for modes_index in range(0, len(xrandout)):
      if searching:
        if xrandout[modes_index].startswith(m_names[i]+' '):
          searching = False
      else:
        if xrandout[modes_index].startswith('   '):
          res = awk(xrandout[modes_index], 1)
          rates = []
          for framerate in range(2, len(xrandout[modes_index].split(' '))):
            rates.append(awk(xrandout[modes_index], framerate))
          r = []
          for each in rates:
            if each != '':
              r.append(each)
          modes[res] = r
        else:
          break
    m_res.append({
      'name': m_names[i],
      'max': f'{x_max}x{y_max}',
      'min': f'{x_min}x{y_min}',
      'modes': modes
    })
  return m_res

def set_monitor(name, primary=None, resolution=None, framerate=None):
  cmd = ['xrandr', '--output', name]
  if primary:
    cmd.append('--primary')
  if resolution:
    cmd.append('--mode')
    cmd.append(resolution)
  if framerate:
    cmd.append('--rate')
    cmd.append(framerate)
  print(subprocess.Popen(cmd, stdout=subprocess.PIPE).stdout.read().decode())


