#! /usr/bin/python

import ping_host

devices = {'router': '192.168.7.77',
           'isp': '192.168.0.1',
           'osmc': '192.168.7.79',
           'komp': '192.168.7.80',
           'bridge': '192.168.7.88'}

def ping_devices(hostmap):

 prefix = "--> "
 
 for k, v in hostmap.iteritems():

  if ping_host.is_pingable(v) == True:
   print prefix + k + ": pingable."
  else:
   print prefix + k + ": unreachable."


ping_devices(devices)
