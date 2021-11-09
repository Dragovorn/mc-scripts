#!/bin/bash

source ./config.sh

while :
do
  echo "Installing install dir..."
  mv -v $INSTALL_DIR/mods/*.jar $SERVER_DIR/mods/
