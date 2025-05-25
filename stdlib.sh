#!/usr/bin/env bash


hakoniwa_run() {
  local bin="$1"
  local profile="$2"
  shift; shift

  # the command is already running in a hakoniwa.d container, donot create a nested container
  if [ -d "/run/hakoniwad" ]; then
    exec "$bin" "$@"
    return 0
  fi

  # temporarily disabled by user
  if [ "$HAKONIWAD" = 0 ]; then
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

  # launch a SHELL or an application
  if [ "$HAKONIWAD_CONSOLE" = 1 ]; then
    exec /usr/bin/hakoniwa run $logging -c "$profile" -- "$SHELL"
  else
    exec /usr/bin/hakoniwa run $logging -c "$profile" -- "$bin" "$@"
  fi
}
