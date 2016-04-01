#! /bin/bash

MINIDLNA_FOLDER=/var/lib/minidlna

function execute {
 echo "Starting minidlna refresh."
 deleteOldDatabase
 restartService
 echo "Script executed."
}

function restartService {
 echo "restarting service..."
 service minidlna restart
 echo "service restarted."
}

function deleteOldDatabase {
 echo "deleting old database..."
 cd $MINIDLNA_FOLDER
 rm -rf *
 echo "database deleted."
}

execute
