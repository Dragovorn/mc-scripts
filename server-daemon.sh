#!/bin/bash

source config.sh
#source ./.scripts/functions.sh

#import_config

while :
do
  echo "Updating server..."
  eval $UPDATE_COMMAND
  echo "Installing install dir..."
  mv -v $INSTALL_DIR/mods/*.jar $RUN_DIR/mods/
  echo "Starting server..."
  eval $RUN_SCRIPT
  echo "Server has stopped. Restarting in 5 seconds... (Control-C to full stop)"
  sleep 5s
done
