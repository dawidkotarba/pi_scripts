#! /bin/bash

SCRIPT_PATH=$(dirname $0)/includes
source $SCRIPT_PATH/create_folder.sh
source $SCRIPT_PATH/count_lines.sh

LOG_DIR=/logs
OUT_FILENAME=temp.log

execute() {
 local fileName=$LOG_DIR/$OUT_FILENAME
 local maxTempEntries=100

 createFolder /logs 755

 echo "Writing temperature to file..."
 countLines $fileName
 local currentEntries=$?

if [ $currentEntries > $maxTempEntries ]; then
  getCurrentTemp > $fileName
 else
  getCurrentTemp >> $fileName
 fi

 echo "Script finished."
}

getCurrentTemp() {
 echo `date`:`/opt/vc/bin/vcgencmd measure_temp`
}

execute
