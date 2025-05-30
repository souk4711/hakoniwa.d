#!/usr/bin/env bash
#
# THIS FILE IS PART OF HAKONIWA.D
#
# HAKONIWA.D: https://github.com/souk4711/hakoniwa.d
# SPDX-License-Identifier: GPL-3.0-only


set -euo pipefail


command_exists() {
  type "${1}" > /dev/null 2>&1
}

echo_info() {
  echo -e "\e[1;34mINFO: $* \e[m"
}

echo_warn() {
  echo -e "\e[1;33mWARN: $* \e[m"
}

echo_error() {
  echo -e "\e[1;31mERROR: $* \e[m"
}


uninstall_binwrappers() {
  echo_info "Uninstall binary wrappers..."

  for file in /usr/local/bin/*; do
    if grep -q "hakoniwa.*run" "$file"; then
      echo "removing $file"
      rm "$file"
    fi
  done
}

uninstall_hakoniwa_d() {
  echo_info "Uninstall hakoniwa.d..."

  echo "removing /etc/hakoniwa.d/abstractions/"
  echo "removing /etc/hakoniwa.d/presets/"
  echo "removing /etc/hakoniwa.d/*.toml"
  rm -rf /etc/hakoniwa.d/abstractions/
  rm -rf /etc/hakoniwa.d/presets/
  rm -f /etc/hakoniwa.d/*.toml

  echo "removing /usr/lib/hakoniwa.d/"
  rm -rf /usr/lib/hakoniwa.d/

  if command_exists "apt"; then
    echo "removing /etc/apt/apt.conf.d/hakoniwa-update-desktop-files"
    rm -f /etc/apt/apt.conf.d/hakoniwa-update-desktop-files
  elif command_exists "dnf"; then
    echo "removing /etc/dnf/libdnf5-plugins/actions.d/hakoniwa-update-desktop-files.actions"
    rm -f /etc/dnf/libdnf5-plugins/actions.d/hakoniwa-update-desktop-files.actions
  elif command_exists "pacman"; then
    echo "removing /usr/share/libalpm/hooks/hakoniwa-update-desktop-files.hook"
    rm -f /usr/share/libalpm/hooks/hakoniwa-update-desktop-files.hook
  fi
}

uninstall_hakoniwa() {
  echo_info "Uninstall hakoniwa..."

  echo "removing /usr/bin/hakoniwa"
  rm -f /usr/bin/hakoniwa
}


main() {
  if [ "$(id -u)" -ne 0 ]; then
    echo_error "Please run this script as sudo or root."
    exit 1
  fi

  cd "$(dirname -- "$0")/.."
  uninstall_binwrappers
  uninstall_hakoniwa_d
  uninstall_hakoniwa
}
main "$@"
