#! /bin/bash

SCRIPT_PATH=$(dirname $0)/includes
source $SCRIPT_PATH/create_folder.sh

DESTINATION=/shared

execute() {
 createFolder $DESTINATION 777
 mount_hdd sda1
 mount_hdd sdb1
}

mount_hdd() {
 mount /dev/$1 $DESTINATION
}

execute
