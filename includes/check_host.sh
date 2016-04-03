#! /bin/bash
 
checkHost() {
IP=$1

 if ping -c 1 $IP &> /dev/null
 then
  echo 1
 else
  echo 0
 fi
}
