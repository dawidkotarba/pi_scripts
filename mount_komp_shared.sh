#! /bin/bash

SCRIPT_PATH=${0%/*}
source $SCRIPT_PATH/create_folder.sh

USERNAME=$1
PASSWORD=$2
IP=//192.168.7.80
SOURCE_FOLDER=shared
DESTINATION=/komp

function execute {
 createFolder $DESTINATION 777
 mount_folder
}

function mount_folder {
 echo "Mounting..."
 mount -t cifs -o username=$USERNAME,password=$PASSWORD $IP/$SOURCE_FOLDER $DESTINATION
 echo "Script finished."
}

execute
