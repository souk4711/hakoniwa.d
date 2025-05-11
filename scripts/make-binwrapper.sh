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


install_binwrappers() {
  echo_info "Generating binary wrappers in /usr/local/bin/..."

  while read -r bin profile
  do
    install_binwrapper "$bin" "$profile"
  done < <(sed '/^$/d' ./scripts/binwrapper.csv | tr -s '[:blank:]')
}

install_binwrapper() {
  local bin="/usr/bin/$1"
  local binwrapper="/usr/local/bin/$1"
  local profile="/etc/hakoniwa.d/$2"

  if ! command_exists "$bin"; then
    if command_exists "$binwrapper" && grep -q "hakoniwa.*run.*$bin" "$binwrapper"; then
      echo "removing $binwrapper"
      rm "$binwrapper"
    fi
    return 0
  fi

  if [ ! -r "$profile" ]; then
    echo_warn "Profile $profile for $bin is unreadable, SKIPPING"
    return 0
  fi

  echo "creating $binwrapper"
  cat <<EOT > "$binwrapper"
#!/usr/bin/env bash

. /usr/lib/hakoniwa.d/stdlib.sh
hakoniwa_run $bin $profile "\$@"
EOT
  chmod +x "$binwrapper"
}


main() {
  if [ "$(id -u)" -ne 0 ]; then
    echo_error "Please run this script as sudo or root."
    exit 1
  fi

  cd "$(dirname -- "$0")/.."
  install_binwrappers
}
main "$@"
