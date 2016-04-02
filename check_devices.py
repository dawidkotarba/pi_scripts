#! /usr/bin/python

import check_host

def check_devices(host):
 if check_host.is_pingable(host) == True:
  print("pingable")
 else:
  print("unreach")

check_devices("192.168.7.80")
