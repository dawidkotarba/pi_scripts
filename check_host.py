#! /usr/bin/python

import os


def check_host(host):
    if os.system("ping -c 1 " + host) == 0:
        return True;
    else:
        return False;
