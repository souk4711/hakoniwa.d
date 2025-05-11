#!/usr/bin/env bash

hakoniwa_run() {
  local bin="$1"
  local profile="$2"
  shift; shift

  if [ "$HAKONIWA" = "0" ]; then
    exec "$bin" "$@"
    return 0
  fi

  exec /usr/bin/hakoniwa run -c "$profile" -- "$bin" "$@"
}
