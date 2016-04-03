#! /bin/bash

createFolder() {

 DESTINATION=$1
 DESTINATION_RIGHTS=$2

 if [ ! -d "$DESTINATION" ]; then
   echo "Folder $DESTINATION is not present. Creating a folder..."
   mkdir $DESTINATION
   chmod $DESTINATION_RIGHTS $DESTINATION
   echo "Folder created."
 fi
}
