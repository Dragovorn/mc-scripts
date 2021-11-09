SERVER_LAUNCH_PATH="UNSET"
SCREEN_NAME="minecraft"

function execute_command() {
  if [ -z "$1" ]; then
    echo "execute_command: need parameter"
    return
  fi

  screen -R $SCREEN_NAME -X stuff "$1 $(printf '\r')"
}
