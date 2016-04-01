#! /bin/bash

SCRIPT_PATH=${0%/*}
source $SCRIPT_PATH/create_folder.sh

LOG_DIR=/logs
OUT_FILENAME=temp.log

function execute {
 createFolder /logs 755 
 echo "Writing temperature to file..."
 getCurrentTemp >> $LOG_DIR/$OUT_FILENAME
 echo "Script finished."
}

function getCurrentTemp {
 echo `date`:`/opt/vc/bin/vcgencmd measure_temp`
}

execute
