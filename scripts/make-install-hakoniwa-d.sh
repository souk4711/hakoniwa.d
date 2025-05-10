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
  echo_info "Installing files /etc/hakoniwa.d..."
  cp -r ./hakoniwa.d/. /etc/hakoniwa.d

  echo_info "Installing files /usr/lib/hakoniwa.d..."
  cp ./scripts/binwrapper.csv /usr/lib/hakoniwa.d/scripts/binwrapper.csv
  cp ./scripts/make-binwrapper.sh /usr/lib/hakoniwa.d/scripts/make-binwrapper.sh
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

  echo "writing file /etc/apt/apt.conf.d/hakoniwa."
  cp ./etc/apt/apt.conf.d/hakoniwa /etc/apt/apt.conf.d/hakoniwa
}

install_dnf_hook() {
  echo "package manager DNF found."
  dnf install -y libdnf5-plugin-actions

  echo "writing file /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.actions."
  cp ./etc/dnf/libdnf5-plugins/actions.d/hakoniwa.actions /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.actions
  cp ./etc/dnf/libdnf5-plugins/actions.d/hakoniwa.sh /etc/dnf/libdnf5-plugins/actions.d/hakoniwa.sh
}

install_pacman_hook() {
  echo "package manager PACMAN found."

  echo "writing file /usr/share/libalpm/hooks/hakoniwa.hook."
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
