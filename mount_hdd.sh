#! /bin/bash

DESTINATION=/shared

function execute {
 createDestinationFolderIfNotExisting
 mount_hdd sda1
 mount_hdd sdb1
}

function createDestinationFolderIfNotExisting {
 if [ ! -d "$DESTINATION" ]; then
  echo "Folder $DESTINATION is not present. Creating a folder..."
  `sudo mkdir $DESTINATION`
  `sudo chmod 777 $DESTINATION`
  echo "Folder created."
 fi
}

function mount_hdd {
 sudo mount /dev/$1 $DESTINATION
}

execute
