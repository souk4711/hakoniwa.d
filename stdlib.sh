#!/usr/bin/env bash


hakoniwa_run() {
  local bin="$1"
  local profile="$2"
  shift; shift

  # the command is already running in hakoniwa, donot wrap it
  if [ -n "$HAKONIWAD_NAME" ]; then
    exec "$bin" "$@"
    return 0
  fi

  # temporarily disabled by user
  if [ "$HAKONIWAD" = "0" ]; then
    exec "$bin" "$@"
    return 0
  fi

  # enable logging
  local logging=""
  case "${HAKONIWAD_LOG,,}" in
    "trace")
      logging="-vv"
    ;;
    "debug")
      logging="-v"
    ;;
  esac

  # wrap the command
  if [ "$HAKONIWAD_CONSOLE" = "1" ]; then
    exec /usr/bin/hakoniwa run $logging -c "$profile" -- "$SHELL"
  else
    exec /usr/bin/hakoniwa run $logging -c "$profile" -- "$bin" "$@"
  fi
}
