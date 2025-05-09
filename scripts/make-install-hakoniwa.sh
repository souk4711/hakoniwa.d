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


install_deps() {
  echo_info "Installing dependencies..."
  if command_exists "apt"; then
    apt install -y libseccomp-dev passt cargo
  elif command_exists "dnf"; then
    dnf install -y libseccomp-devel passt cargo
  elif command_exists "pacman"; then
    pacman -S --noconfirm libseccomp passt cargo
  else
    echo_warn "Unsupported distro - Ubuntu, Fedora, Arch only."
    echo_warn "Please manually install following dependencies:"
    echo_warn "  - cargo"
    echo_warn "  - passt"
    echo_warn "  - libseccomp (devel)"
  fi
}

install_hakoniwa() {
  echo_info "Compiling binary from source code and install to /usr/bin/hakoniwa..."
  cargo install hakoniwa-cli --root /usr --locked
}

configure_selinux() {
  echo_info "Configuring SELinux..."

  if ! command_exists "getenforce"; then
    echo "module SELinux not found. SKIPPING."
    return 0
  fi

  if command_exists "dnf"
  then
    dnf install -y container-selinux
    chcon -u system_u -t container_runtime_exec_t /usr/bin/hakoniwa
  else
    echo_warn "Unsupported distro - Ubuntu, Fedora, Arch only."
    echo_warn "Please manually configure SELinux."
  fi
}

configure_apparmor() {
  echo_info "Configuring AppArmor..."

  if ! command_exists "apparmor_status"; then
    echo "module AppArmor not found. SKIPPING."
    return 0
  fi

  echo "writing file /etc/apparmor.d/hakoniwa."
  cp ./etc/apparmor.d/hakoniwa /etc/apparmor.d/hakoniwa

  if apparmor_status --enabled; then
    echo "restarting AppArmor service."
    systemctl reload apparmor.service
  fi
}


main() {
  if command_exists "/usr/bin/hakoniwa"; then
    echo "/usr/bin/hakoniwa already exists."
    exit 0
  fi

  if [ "$(id -u)" -ne 0 ]; then
    echo_error "Please run this script as sudo or root."
    exit 1
  fi

  install_deps
  install_hakoniwa
  configure_selinux
  configure_apparmor
}
main "$@"
