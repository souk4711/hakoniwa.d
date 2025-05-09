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
git clone https://github.com/souk4711/hakoniwa.d.git

# Install hakoniwa
sudo make install_hakoniwa

# Install hakoniwa profiles
sudo make install_hakoniwa_d
```

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
