#! /bin/bash

LOG_DIR=/logs
OUT_FILENAME=temp.log

function createDestinationFolderIfNotExisting {
 if [ ! -d "$LOG_DIR" ]; then
  echo "Folder $LOG_DIR is not present. Creating a folder..."
  `sudo mkdir $LOG_DIR`
  `sudo chmod 777 $LOG_DIR`
  echo "Folder created."
 fi
}


function execute {
 createDestinationFolderIfNotExisting
 echo "Writing temperature to file..."
 getCurrentTemp >> $LOG_DIR/$OUT_FILENAME
 echo "Script finished."
}

function getCurrentTemp {
 echo `date`:`sudo /opt/vc/bin/vcgencmd measure_temp`
}

execute
