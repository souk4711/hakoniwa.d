#!/usr/bin/env bash


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
  cp -r ./hakoniwa.d/* /etc/hakoniwa.d

  echo_info "Installing files to /usr/lib/hakoniwa.d/..."
  mkdir -p /usr/lib/hakoniwa.d
  mkdir -p /usr/lib/hakoniwa.d/scripts
  cp ./stdlib.sh /usr/lib/hakoniwa.d/
  cp ./scripts/binwrappers.csv /usr/lib/hakoniwa.d/scripts/
  cp ./scripts/make-binwrappers.sh /usr/lib/hakoniwa.d/scripts/
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

  echo "creating /etc/apt/apt.conf.d/hakoniwa."
  cp ./etc/apt/apt.conf.d/hakoniwa /etc/apt/apt.conf.d/hakoniwa
}

install_dnf_hook() {
  echo "package manager DNF found."
  dnf install -y libdnf5-plugin-actions

  echo "creating /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.actions."
  echo "creating /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.sh."
  cp ./etc/dnf/libdnf5-plugins/actions.d/hakoniwa.actions /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.actions
  cp ./etc/dnf/libdnf5-plugins/actions.d/hakoniwa.sh /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.sh
}

install_pacman_hook() {
  echo "package manager PACMAN found."

  echo "creating /usr/share/libalpm/hooks/hakoniwa.hook."
  echo "creating /usr/share/libalpm/scripts/hakoniwa."
  cp ./etc/pacman/hooks/hakoniwa.hook /usr/share/libalpm/hooks/hakoniwa.hook
  cp ./etc/pacman/scripts/hakoniwa /usr/share/libalpm/scripts/hakoniwa
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
