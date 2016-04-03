#! /bin/bash

SCRIPT_PATH=$(dirname $0)/includes
source $SCRIPT_PATH/create_folder.sh
source $SCRIPT_PATH/check_host.sh

USERNAME=$1
PASSWORD=$2
IP=192.168.7.80
SOURCE_FOLDER=shared
DESTINATION=/komp

function execute {
 local isHostAvailable=$(checkHost $IP)

 if [ $isHostAvailable="1" ]; then
  echo "$IP is available. Proceeding with mounting..."
  createFolder $DESTINATION 777
  mount_folder
 else
  echo "$IP is not available. Skipping mount process"
 fi
}

function mount_folder {
 echo "Mounting..."
 mount -t cifs -o username=$USERNAME,password=$PASSWORD //$IP/$SOURCE_FOLDER $DESTINATION
 echo "Script finished."
}

execute
