#! /bin/bash

MINIDLNA_FOLDER=/var/lib/minidlna

execute() {
 echo "Starting minidlna refresh."
 deleteOldDatabase
 restartService
 echo "Script executed."
}

restartService() {
 echo "restarting service..."
 service minidlna restart
 echo "service restarted."
}

deleteOldDatabase() {
 echo "deleting old database..."
 cd $MINIDLNA_FOLDER
 rm -rf *
 echo "database deleted."
}

execute
