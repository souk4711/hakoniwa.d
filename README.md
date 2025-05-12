# Hakoniwa.d

[Hakoniwa][hakoniwa] is an unprivileged sandboxing tool that allows you to build an isolated
environment based on your host os and run application in it. This repository provides a set
of Hakoniwa profiles for the desktop application with following features:

- a separate **HOME** directory for each application
- a root filesystem only contains necessary directories
- network access restrictions

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

You can temporarily disable the profile and run the original version of `firefox` with `HAKONIWAD=0`:

```sh
HAKONIWAD=0 firefox
```

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
