# Application Profiles

A list of all the available applications and their respective permissions.

## Current available applications

| name           | devices       | sockets              | network            | filesystem     |
| -------------- | ------------- | -------------------- | ------------------ | -------------- |
| Brave          | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Chromium       | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Firefox        | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Google Chrome  | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Microsoft Edge | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Vivaldi        | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Zen Browser    | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| Tencent QQ     | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| WeChat         | dri, snd, v4l | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| KGet           | dri, snd      | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| qBittorrent    | dri, snd      | audio, display, dbus | CONNECT TCP 80/443 | ~/Downloads:rw |
| LibreOffice    | dri, snd      | audio, display, dbus |                    | ~/Documents:rw |
| ONLYOFFICE     | dri, snd      | audio, display, dbus |                    | ~/Documents:rw |
| WPS Office     | dri, snd      | audio, display, dbus |                    | ~/Documents:rw |
| Obsidian       | dri, snd      | audio, display, dbus | CONNECT TCP 80/443 | ~/Notes:rw     |
| asdf-vm        |               |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |
| mise           |               |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |
| makepkg        |               |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |

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
