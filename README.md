# Hakoniwa.d

[Hakoniwa][hakoniwa] is an unprivileged sandboxing tool that allows you to build an isolated
environment based on your host os and run application in it. This repository provides a set
of Hakoniwa profiles for the desktop application with following features:

- a separate HOME directory for each application
  - the new HOME directory is located in `~/.local/share/hakoniwa/apps/`
- filesystem access restrictions
  - the rootfs contains only `/bin`, `/etc`, `/lib`, `/lib64`, `/lib32`, `/sbin`, `/usr`, `/opt`, `/sys`
  - cannot access devices or sockets by default
  - cannot run any SUID binaries
- network access restrictions
  - cannot connect to a remote TCP port by default
  - cannot bind a local TCP port by default
- unlock restrictions by configuring the app specifically
  - currently supported application profiles can be found [here](./applications.md)

## Requirements

- Linux kernel 6.7 or later
- Rust 1.85 or later

## Installation

```sh
# Clone repository
git clone https://github.com/souk4711/hakoniwa.d.git && cd hakoniwa.d

# Install hakoniwa to /usr/bin/hakoniwa
sudo make install_hakoniwa

# Install hakoniwa profiles to /etc/hakoniwa.d/
sudo make install_hakoniwa_d

# OPTIONAL: Generate a set of default binary wrappers in /usr/local/bin/
sudo make binwrappers

# OPTIONAL: Generate a specified binary wrapper in /usr/local/bin/
sudo make binwrapper bin=firefox
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

By default, the sandboxed firefox can only access ports `80` and `443`. To allow it access to extra ports,
e.g. `8080`, you can create a file `/etc/hakoniwa.d/local/firefox.toml` with the following content:

```toml
[[landlock.net]]
port = 8080
access = "tcp.connect"
```

By default, the sandboxed firefox can only access folder `~/Downloads` with read-write permission. To allow
it access extra folders, e.g. `Desktop`, you can create a file `/etc/hakoniwa.d/local/firefox.toml` with the
following content:

```toml
[[mounts]]
source = "{{ HOME }}/Desktop"
rw = true
```

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
