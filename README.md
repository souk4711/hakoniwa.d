# Hakoniwa.d

[Hakoniwa] is a sandbox tool that allows you to build an isolated environment based
on your host os and run application in it. This repository provides a set of [Hakoniwa]
profiles for the desktop application with following features:

- a separate home directory for each application
- a root filesystem only contains following directories `/bin`, `/etc`, `/lib`, `/lib64`,
  `/lib32`, `/sbin`, `/usr`, `/opt`, `/sys` etc.
- network access restrictions

## Installation

### 1. Install Hakoniwa

**Arch**:

```sh
sudo pacman -S libseccomp passt cargo

cargo install hakoniwa-cli --locked
sudo mv ~/.cargo/bin/hakoniwa /usr/bin/hakoniwa
```

**Fedora 41**:

```sh
sudo dnf install libseccomp-devel passt cargo

cargo install hakoniwa-cli --locked
sudo mv ~/.cargo/bin/hakoniwa /usr/bin/hakoniwa
```

**Ubuntu 24.04**

```sh
sudo apt install libseccomp-dev passt cargo

cargo install hakoniwa-cli --locked
sudo mv ~/.cargo/bin/hakoniwa /usr/bin/hakoniwa
```

**Other**

[Hakoniwa#Installation](https://github.com/souk4711/hakoniwa?tab=readme-ov-file#installation)

### 2. Install Hakoniwa.d Profiles

```
wget https://github.com/souk4711/hakoniwa.d/archive/refs/heads/main.zip
unzip main.zip
cp -rv hakoniwa.d-main/hakoniwa.d ~/.config/hakoniwa.d
```

### 3. Testing Profile

```
mkdir -p ~/.local/share/hakoniwa/apps/firefox
hakoniwa run -v -c ~/.config/hakoniwa.d/firefox.toml -- /bin/firefox
```

It will launch the Firefox browser.

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[Hakoniwa]: https://github.com/souk4711/hakoniwa
