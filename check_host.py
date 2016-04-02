#! /usr/bin/python

import os


def is_pingable(host):
    if os.system("ping -c 1 " + host) == 0:
        return True;
    else:
        return False;
