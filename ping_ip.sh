#!/bin/bash
 
function ping_host {
IP=$1

 if ping -c 1 $IP &> /dev/null
 then
  exit 1
 else
  exit 0
 fi
}
