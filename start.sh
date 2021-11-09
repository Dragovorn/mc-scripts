#!/bin/bash

source ./config.sh

echo "Starting minecraft server"
echo "Using screen: $SCREEN_NAME"

if [ "$SERVER_LAUNCH_PATH" == "UNSET" ]; then
  echo "Please provide a server launch path in the config.sh file!"
  return
fi

echo "Server launch exec: $SERVER_LAUNCH_PATH"
echo "Starting daemon..."
screen -dmS $SCREEN_NAME ./start-server.sh
sleep 1s
echo "Daemon launched."

if [ "$1" == "-a" ]; then
  echo "Attach flag found. Attaching..."
  screen -r $SCREEN_NAME
fi
