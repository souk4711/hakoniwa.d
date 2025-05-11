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

  # wrap the command
  exec /usr/bin/hakoniwa run -c "$profile" -- "$bin" "$@"
}
