#! /bin/bash

SCRIPT_PATH=$(dirname $0)/includes
source $SCRIPT_PATH/check_host.sh
source $SCRIPT_PATH/create_folder.sh

USERNAME=$1
PASSWORD=$2
IP=192.168.7.80
GIT_REPO=https://github.com/dawidkotarba/Mind-maps.git
GIT_CLONE_DIR=/temp/MindMaps
SOURCE_DIR=Dropbox/Aplikacje/MindMaps
DESTINATION=/komp/MindMaps

LOG_DIR=/logs
OUT_FILENAME=commit_maps.log

execute() {
 local isHostAvailable=$(checkHost $IP)
 local fileName=$LOG_DIR/$OUT_FILENAME

 if [ $isHostAvailable="1" ]; then
  echo "$IP is available. Proceeding with mounting..."
  createFolder $DESTINATION 777
  mount_folder
  clone
  copyMaps
  cd $GIT_CLONE_DIR
  commit
  echo "maps pushed."
  cleanup
  echo `date`: Maps refreshed > $fileName
 else
  echo "$IP is not available. Skipping mount process"
  echo `date`: Host unreachable > $fileName
 fi
}

clone() {
 echo "cloning from $GIT_CLONE_DIR"
 git clone $GIT_REPO $GIT_CLONE_DIR
}

copyMaps() {
 echo "copying maps..."
 find $DESTINATION -type f -name '*.smmx' -exec cp {} $GIT_CLONE_DIR \;
}

commit() {
 git add *
 git commit -m "update maps @pi"
 echo "pushing mind maps..."
 git push origin master
}

mount_folder() {
 echo "Mounting..."
 mount -t cifs -o username=$USERNAME,password=$PASSWORD //$IP/$SOURCE_DIR $DESTINATION
 echo "Script finished."
}

cleanup() {
 echo "removing temporary directories..."
 rm -rf $GIT_CLONE_DIR
}

execute
