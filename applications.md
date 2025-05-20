# Application Profiles

A list of all the available applications and their respective permissions.

## Current available applications

| name           | category | devices    | sockets              | network            | filesystem     |
| -------------- | -------- | ---------- | -------------------- | ------------------ | -------------- |
| Brave          | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| Chromium       | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| Firefox        | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| Google Chrome  | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| Microsoft Edge | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| Vivaldi        | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| Zen Browser    | Internet | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Downloads:rw |
| LibreOffice    | Office   | dri, sound | audio, display       |                    | ~/Documents:rw |
| ONLYOFFICE     | Office   | dri, sound | audio, display       |                    | ~/Documents:rw |
| WPS Office     | Office   | dri, sound | audio, display       |                    | ~/Documents:rw |
| Obsidian       | Office   | dri, sound | dbus, audio, display | CONNECT TCP 80/443 | ~/Notes:rw     |
| asdf-vm        | CLI      |            |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |
| mise           | CLI      |            |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |
| makepkg        | CLI      |            |                      | CONNECT TCP 80/443 | ~/Code:rw, ... |

The meaning of the permissions used in the tables:

- **devices**
  - **dri:** Allow access graphic cards, includes `/dev/dri`, `/dev/nvidia*`
  - **sound:** Allow acces sound cards, includes `/dev/snd`
- **sockets**
  - **dbus:** Allow access D-Bus buses, includes the system bus and the session bus
  - **audio:** Allow access audio servers, includes PipeWire, PulseAudio
  - **display:** Allow access display server, includes Wayland, X11
- **network**
  - **CONNECT:** Allow outgoing connections on PORT
  - **BIND:** Allow incoming connections on PORT
- **filesystem**
  - **... :** Represents necessary hidden directories/files
