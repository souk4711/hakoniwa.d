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

```sh
wget https://github.com/souk4711/hakoniwa.d/archive/refs/heads/main.zip
unzip main.zip
sudo cp -rv hakoniwa.d-main/hakoniwa.d/. /etc/hakoniwa.d
```

### 3. Testing Profile

```sh
hakoniwa run -v -c /etc/hakoniwa.d/firefox.toml -- /bin/firefox
```

It will launch the Firefox browser.

> [!NOTE]
>
> - If you receive `hakoniwa: write("/proc/self/uid_map", ...) => Operation not permitted (os error 1)`, read [this][troubleshooting-apparmor] to learn more.

## Usage

### Profile Customisation

Create a file under `/etc/hakoniwa.d/local`, e.g.:

```jinja
# /etc/hakoniwa.d/local/firefox.toml


# Allow outgoing TCP connections
{% for port in [
  8080,
] %}
[[landlock.net]]
port = {{ port }}
access = "tcp.connect"
{% endfor %}

# Share folders - $HOME/Documents
[[mounts]]
source = "{{ HOME }}/Documents"
rw = true
```

It will autoload when you launch Firefox using the following command line:

```sh
hakoniwa run -v -c /etc/hakoniwa.d/firefox.toml -- /bin/firefox
```

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
[troubleshooting-apparmor]: https://github.com/souk4711/hakoniwa/blob/main/hakoniwa-cli/docs/troubleshooting-apparmor
