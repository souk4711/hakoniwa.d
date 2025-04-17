# Hakoniwa.d

[Hakoniwa][hakoniwa] is an unprivileged sandboxing tool that allows you to build an isolated
environment based on your host os and run application in it. This repository provides a set
of Hakoniwa profiles for the desktop application with following features:

- a separate **HOME** directory for each application
- a root filesystem only contains necessary directories
- network access restrictions

## Installation

### 1. Install Hakoniwa

**Arch**

```sh
sudo pacman -S libseccomp passt cargo

cargo install hakoniwa-cli --locked
sudo mv ~/.cargo/bin/hakoniwa /usr/bin/hakoniwa
```

**Fedora 41**

```sh
sudo dnf install libseccomp-devel passt cargo

cargo install hakoniwa-cli --locked
sudo mv ~/.cargo/bin/hakoniwa /usr/bin/hakoniwa
sudo chcon -u system_u -t container_runtime_exec_t /usr/bin/hakoniwa
```

**Ubuntu 24.04**

```sh
sudo apt install libseccomp-dev passt cargo

cargo install hakoniwa-cli --locked
sudo mv ~/.cargo/bin/hakoniwa /usr/bin/hakoniwa
```

**Other Installation Methods**

[Hakoniwa#Installation](https://github.com/souk4711/hakoniwa?tab=readme-ov-file#installation)

### 2. Install Hakoniwa.d Profiles

```
wget https://github.com/souk4711/hakoniwa.d/archive/refs/heads/main.zip
unzip main.zip
sudo cp -rv hakoniwa.d-main/hakoniwa.d/. /etc/hakoniwa.d
```

### 3. Testing Profile

```
hakoniwa run -v -c /etc/hakoniwa.d/firefox.toml -- /bin/firefox
```

It will launch the Firefox browser.

> [!NOTE]
> If AppArmor is enabled on your host os, create an unconfined profile for Hakoniwa
> first, read [this][troubleshooting-apparmor] to learn more.

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
