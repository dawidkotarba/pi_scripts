#! /usr/bin/python

import ping_host

devices = {'router': '192.168.7.77',
           'isp': '192.168.0.1',
           'osmc': '192.168.7.79',
           'pc': '192.168.7.80',
           'bridge': '192.168.7.88',
           'tv': '192.168.7.81',
           'tab': '192.168.7.82',
           'and+': '192.168.7.83',
           'and3': '192.168.7.84',
           'and4': '192.168.7.85'}


def ping_devices(hostmap):

 separatorLenght = 60
 reachable = {}
 unreachable = {} 

 for k, v in hostmap.iteritems():
  if ping_host.is_pingable(v) == True:
   reachable[k] = v
  else:
   unreachable[k] = v
 
 print_line(separatorLenght)
 print "Reachable: ", reachable.keys()
 print "Unreachable: ", unreachable.keys()
 print_line(separatorLenght)


def print_line(chars):
 line = ''
 for c in range(chars):
  line = line + '-'
 print line


ping_devices(devices)
