#!/bin/bash

source config.sh
#source ./.scripts/functions.sh

#import_config

if [ -z "${SCREEN_NAME+x}" ]; then
  echo "Could not import config!"
  exit
fi

echo "Starting minecraft server"
echo "Using screen: $SCREEN_NAME"
echo "Server path: $RUN_DIR"
echo "Starting daemon..."
screen -dmS $SCREEN_NAME "$RUN_DIR/server-daemon.sh"
sleep 1s
echo "Daemon launched."

if [ "$1" == "-a" ]; then
  echo "Attach flag found. Attaching..."
  screen -r $SCREEN_NAME
fi
