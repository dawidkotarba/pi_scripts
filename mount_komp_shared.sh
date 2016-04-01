#! /bin/bash

USERNAME=$1
PASSWORD=$2
IP=//192.168.7.80
SOURCE_FOLDER=shared
DESTINATION=/komp

function execute {
 createDestinationFolderIfNotExisting
 mount
}

function createDestinationFolderIfNotExisting {
 if [ ! -d "$DESTINATION" ]; then
  echo "Folder $DESTINATION is not present. Creating a folder..."
  `sudo mkdir $DESTINATION`
  `sudo chmod 777 $DESTINATION`
  echo "Folder created."
 fi
}

function mount {
 echo "Mounting..."
 sudo mount -t cifs -o username=$USERNAME,password=$PASSWORD $IP/$SOURCE_FOLDER $DESTINATION
 echo "Script finished."
}

execute
