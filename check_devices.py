#! /usr/bin/python

import check_host

devices = {'router': '192.168.7.77',
           'isp': '192.168.0.1',
           'osmc': '192.168.7.79',
           'komp': '192.168.7.80',
           'bridge': '192.168.7.88'}

def check_devices(hostmap):

 prefix = "--> "
 
 for k, v in hostmap.iteritems():

  if check_host.is_pingable(v) == True:
   print prefix + k + ": pingable."
  else:
   print prefix + k + ": unreachable."


check_devices(devices)
