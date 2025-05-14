# Hakoniwa.d

[Hakoniwa][hakoniwa] is an unprivileged sandboxing tool that allows you to build an isolated
environment based on your host os and run application in it. This repository provides a set
of Hakoniwa profiles for the desktop application with following features:

- a separate **HOME** directory for each application
  - the new HOME directory is located in `~/.local/share/hakoniwa/apps/`
- filesystem access restrictions
  - the rootfs contains only `/bin`, `/etc`, `/lib`, `/lib64`, `/lib32`, `/sbin`, `/usr`, `/opt`, `/sys`
  - cannot access devices or sockets by default
  - cannot run any SUID binaries
- network access restrictions
  - cannot connect to a remote TCP port by default
  - cannot bind a local TCP port by default
- application-specific configuration
  - current supported applications can be found [here](./applications.md)

## Requirements

- Linux kernel 6.7 or later, e.g.
  - Arch
  - Fedora 41
  - Ubuntu 24.04

## Installation

```sh
# Clone repository
git clone https://github.com/souk4711/hakoniwa.d.git && cd hakoniwa.d

# Install hakoniwa to /usr/bin/hakoniwa
sudo make install_hakoniwa

# Install hakoniwa profiles to /etc/hakoniwa.d/
sudo make install_hakoniwa_d

# OPTIONAL: Generate binary wrappers in /usr/local/bin/
sudo make binwrappers
```

## Usage

Launch application `/usr/bin/firefox` with a hakoniwa.d profile:

```sh
hakoniwa run -c /etc/hakoniwa.d/firefox.toml -- /usr/bin/firefox
```

If you have installed binary wrappers, then use the binwrapper:

```sh
/usr/local/bin/firefox
```

Or just type `firefox` if the `/usr/local/bin` is set in the `PATH` environment:

```sh
firefox
```

You can temporarily disable the profile and run the original version with `HAKONIWAD=0`:

```sh
HAKONIWAD=0 firefox
```

Want to see what profiles are enabled, use `HAKONIWAD_LOG=DEBUG` to display the logging output:

```sh
HAKONIWAD_LOG=DEBUG firefox
```

Want to enter the sandbox interactively, use `HAKONIWAD_CONSOLE=1` to open a shell:

```sh
HAKONIWAD_LOG=DEBUG HAKONIWAD_CONSOLE=1 firefox
```

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
