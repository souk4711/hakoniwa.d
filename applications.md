# Application Profiles

A list of all the available applications and their respective permissions.

## Current available applications

| name           | category   | devices       | sockets              | network            | filesystem     |
| -------------- | ---------- | ------------- | -------------------- | ------------------ | -------------- |
| Brave          | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Chromium       | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Falkon         | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Firefox        | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Google Chrome  | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| LibreWolf      | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Microsoft Edge | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| qutebrowser    | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Vivaldi        | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Zen Browser    | Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Tencent QQ     | Chat       | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| WeChat         | Chat       | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| KGet           | Downloader | dri, snd      | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| qBittorrent    | Downloader | dri, snd      | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| LibreOffice    | Office     | dri, snd      | audio, display, dbus |                    | ~/Documents:rw |
| ONLYOFFICE     | Office     | dri, snd      | audio, display, dbus |                    | ~/Documents:rw |
| WPS Office     | Office     | dri, snd      | audio, display, dbus |                    | ~/Documents:rw |
| Obsidian       | PKMS       | dri, snd      | audio, display, dbus | CONNECT TCP 80/443 | ~/Notes:rw     |
| asdf-vm        | Devkit     |               |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |
| mise           | Devkit     |               |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |
| makepkg        | Devkit     |               |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |

The meaning of the permissions used in the tables:

- **devices**
  - **dri:** Allow access graphic cards, includes `/dev/dri`, `/dev/nvidia*`
  - **snd:** Allow access sound cards, includes `/dev/snd`
  - **v4l:** Allow access video capture cards, includes `/dev/v4l`, `/dev/video*`
- **sockets**
  - **audio:** Allow access audio servers, includes PipeWire, PulseAudio
  - **display:** Allow access display server, includes Wayland, X11
  - **dbus:** Allow access D-Bus buses, includes the system bus and the session bus
- **network**
  - **CONNECT:** Allow outgoing connections on PORT
  - **BIND:** Allow incoming connections on PORT
- **filesystem**
  - **... :** Represents necessary hidden directories/files
