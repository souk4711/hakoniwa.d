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

install_hakoniwa_d() {
  echo_info "Installing files to /etc/hakoniwa.d/..."
  mkdir -p /etc/hakoniwa.d
  cp -r ./hakoniwa.d/profiles/* /etc/hakoniwa.d

  echo_info "Installing files to /usr/lib/hakoniwa.d/..."
  mkdir -p /usr/lib/hakoniwa.d
  mkdir -p /usr/lib/hakoniwa.d/utils
  cp ./hakoniwa.d/stdlib.sh /usr/lib/hakoniwa.d
  cp ./hakoniwa.d/utils/* /usr/lib/hakoniwa.d/utils
}

install_package_manager_hook() {
  echo_info "Installing package manager hook..."

  if command_exists "apt"; then
    install_apt_hook
  elif command_exists "dnf"; then
    install_dnf_hook
  elif command_exists "pacman"; then
    install_pacman_hook
  else
    echo_warn "Unsupported package manager - APT, DNF, PACMAN only."
    echo_warn "Please manually install package manager hook."
  fi
}

install_apt_hook() {
  echo "package manager APT found."

  echo "creating /etc/apt/apt.conf.d/hakoniwa-update-desktop-files."
  cp ./etc/apt/apt.conf.d/hakoniwa-update-desktop-files /etc/apt/apt.conf.d
}

install_dnf_hook() {
  echo "package manager DNF found."
  dnf install -y libdnf5-plugin-actions

  echo "creating /etc/dnf/libdnf5-plugins/actions.d/hakoniwa-update-desktop-files.actions."
  cp ./etc/dnf/libdnf5-plugins/actions.d/hakoniwa-update-desktop-files.actions /etc/dnf/libdnf5-plugins/actions.d
}

install_pacman_hook() {
  echo "package manager PACMAN found."

  echo "creating /usr/share/libalpm/hooks/hakoniwa-update-desktop-files.hook."
  cp ./etc/pacman/hooks/hakoniwa-update-desktop-files.hook /usr/share/libalpm/hooks
}


main() {
  if [ "$(id -u)" -ne 0 ]; then
    echo_error "Please run this script as sudo or root."
    exit 1
  fi

  cd "$(dirname -- "$0")/.."
  install_hakoniwa_d
  install_package_manager_hook
}

main "$@"
