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


usage() {
    echo "Usage:"
    echo ""
    echo "  # Generate a specified binary wrapper"
    echo "  $ sudo $0 --bin firefox"
    echo ""
    echo "  # Generate a set of binary wrappers"
    echo "  $ sudo $0 --group browser"
}

cleanup_binwrappers() {
  echo_info "Cleaning up outdated binary wrappers in /usr/local/bin/..."

  while read -r bin profile
  do
    cleanup_binwrapper "$bin"
  done < <(sed -e '/^$/d' -e '/^#.*/d' ./scripts/binwrappers.csv | tr -s '[:blank:]')
}

cleanup_binwrapper() {
  local bin="/usr/bin/$1"
  local binwrapper="/usr/local/bin/$1"

  if ! command_exists "$bin"; then
    if command_exists "$binwrapper" && grep -q "hakoniwa.*run.*$bin" "$binwrapper"; then
      echo "removing $binwrapper."
      rm "$binwrapper"
    fi
  fi
}

install_binwrappers_bin() {
  echo_info "Generating binary wrappers in /usr/local/bin/..."

  local found=false
  while read -r group bin profile
  do
    if [ "$1" == "$bin" ] || [ "$1" == "*" ]; then
      install_binwrapper "$bin" "$profile"
      found=true
    fi
  done < <(sed -e '/^$/d' -e '/^#.*/d' ./scripts/binwrappers.csv | tr -s '[:blank:]')

  if [ "$found" == false ]; then
    echo_warn "No builtin profile for '$1'. SKIPPING"
    return 0
  fi
}

install_binwrappers_group() {
  echo_info "Generating binary wrappers in /usr/local/bin/..."

  local found=false
  local groups=(browser)
  while read -r group bin profile
  do
    if [ "$1" == "$group" ] || [ "$1" == "*" ]; then
      install_binwrapper "$bin" "$profile"
      found=true
    fi

    if [ "$group" != "${groups[-1]}" ]; then
      groups+=("$group")
    fi
  done < <(sed -e '/^$/d' -e '/^#.*/d' ./scripts/binwrappers.csv | tr -s '[:blank:]')

  if [ "$found" == false ]; then
    echo_warn "No such group '$1'. SKIPPING"
    echo_warn "Please use one of the following groups:"
    for group in "${groups[@]}"
    do
      echo_warn "  - $group"
    done
    return 0
  fi
}

install_binwrapper() {
  local bin="/usr/bin/$1"
  local binwrapper="/usr/local/bin/$1"
  local profile="/etc/hakoniwa.d/$2"

  if ! command_exists "$bin"; then
    return 0
  fi

  if [ ! -r "$profile" ]; then
    echo_warn "Profile $profile for $bin is unreadable, SKIPPING."
    return 0
  fi

  echo "creating $binwrapper."
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
  case "${1-}" in
    "--bin")
      cleanup_binwrappers
      install_binwrappers_bin "${2-}"
      ;;
    "--group")
      cleanup_binwrappers
      install_binwrappers_group "${2-}"
      ;;
    *)
      usage
      ;;
  esac
}
main "$@"
