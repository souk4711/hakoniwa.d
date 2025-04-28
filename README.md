# Hakoniwa.d

[Hakoniwa][hakoniwa] is an unprivileged sandboxing tool that allows you to build an isolated
environment based on your host os and run application in it. This repository provides a set
of Hakoniwa profiles for the desktop application with following features:

- a separate **HOME** directory for each application
- a root filesystem only contains necessary directories
- network access restrictions

## Installation

### 1. Install Hakoniwa

[Hakoniwa#Installation](https://github.com/souk4711/hakoniwa?tab=readme-ov-file#installation)

### 2. Install Hakoniwa.d Profiles

```sh
wget https://github.com/souk4711/hakoniwa.d/archive/refs/heads/main.zip
unzip main.zip
sudo cp -rv hakoniwa.d-main/etc/hakoniwa.d/. /etc/hakoniwa.d
```

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
