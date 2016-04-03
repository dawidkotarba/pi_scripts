#! /bin/bash

SCRIPT_PATH=$(dirname $0)/includes
source $SCRIPT_PATH/create_folder.sh
source $SCRIPT_PATH/count_lines.sh

LOG_DIR=/logs
OUT_FILENAME=temp.log

execute() {
 createFolder /logs 755
 writeToFile
 echo "Script finished."
}

writeToFile(){
 local fileName=$LOG_DIR/$OUT_FILENAME

 echo "Writing temperature to file..."
 countLines $fileName
 local currentEntries=$?

if [ $currentEntries -gt 100 ]; then
  getCurrentTemp > $fileName
 else
  getCurrentTemp >> $fileName
 fi

}

getCurrentTemp() {
 echo `date`:`/opt/vc/bin/vcgencmd measure_temp`
}

execute
