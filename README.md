# Hakoniwa.d

Hakoniwa profiles for the desktop applications. It uses container-type sandboxes
to isolate applications and increase desktop system security. By default, the
applications have limited access to the host resources. This includes:

- A slimmed-down host file system with read-only access.
- A separate HOME directory only contains the application's data.
- No access to the network.
- No access to unnecessary devices.
- No access to unnecessary host services.

Most desktop applications require access to some host resources to function properly.
For example, they need X11 for the user interface, PulseAudio for audio playback, and
D-Bus to send notifications. Document [applications.md](./applications.md) lists all
available applications and their respective permissions.

> [!WARNING]
> Running untrusted code is never safe, sandboxing cannot change this.

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

# OPTIONAL: Generate a specified binary wrapper in /usr/local/bin/
sudo make binwrappers bin=firefox

# OPTIONAL: Generate a set of binary wrappers in /usr/local/bin/
sudo make binwrappers group=browser
```

## Usage

Launch application `/usr/bin/firefox` with a hakoniwa profile:

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

Want to see what profiles are enabled, use `HAKONIWAD_LOG=TRACE` to display the logging output:

```sh
HAKONIWAD_LOG=TRACE firefox
```

Want to enter the sandbox interactively, use `HAKONIWAD_CONSOLE=1` to open a shell:

```sh
HAKONIWAD_LOG=TRACE HAKONIWAD_CONSOLE=1 firefox
```

By default, the sandboxed browser can only access ports `80` and `443`, as well as the folder `~/Downloads`.
To allow access to more host resources, create a file called `/etc/hakoniwa.d/local/firefox.toml` with
the following contents:

```jinja
# Allow connections on HTTP-ALT/8080, FTP/22, etc.
{% include "abstractions/network/connect/any.toml" %}

# Grant  read-only permission to HOME directory.
# Grant read-write permission to Downloads directory.
{% include "abstractions/filesystem/rdonly/media.toml" %}
{% include "abstractions/filesystem/rdonly/u-home-slim.toml" %}
{% include "abstractions/filesystem/rdonly/u-trash.toml" %}
{% include "abstractions/filesystem/xdg-downloads.toml" %}
```

## Development

### Makefile

| Command                        | Description                                     |
| ------------------------------ | ----------------------------------------------- |
| `sudo make binwrappers`        | Generate binary wrappers in `/usr/local/bin/`   |
| `sudo make install_hakoniwa`   | Install hakoniwa to `/usr/bin/hakoniwa`         |
| `sudo make install_hakoniwa_d` | Install hakoniwa profiles to `/etc/hakoniwa.d/` |
| `sudo make uninstall`          | Uninstall hakoniwa stuff                        |
| `make lint`                    | Run lints                                       |
| `make test`                    | Run test suites                                 |
| `make help`                    | Print help                                      |

## License

Licensed under the [GPL-3.0-only](./LICENSE).

[hakoniwa]: https://github.com/souk4711/hakoniwa
