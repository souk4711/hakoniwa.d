# Hakoniwa.d Applications

Explanation of the meaning of the words used in the following tables:

- **devices**
  - **dri:** Graphic cards, includes `/dev/dri`, `/dev/nvidia*`
  - **sound:** Sound cards, includes `/dev/snd`
- **sockets**
  - **dbus:** D-Bus buses, includes the system bus and the session bus
  - **audio:** Audio servers, includes PipeWire, PulseAudio
  - **display:** Display server, includes Wayland, X11
- **network**
  - **CONNECT:** Allow outgoing connections on PORT
  - **BIND:** Allow incoming connections on PORT
- **filesystem**
  - **... :** Represents necessary hidden directories/files

## Internet

| name           | devices    | sockets              | network        | filesystem     |
| -------------- | ---------- | -------------------- | -------------- | -------------- |
| Brave          | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |
| Chromium       | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |
| Firefox        | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |
| Google Chrome  | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |
| Microsoft Edge | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |
| Vivaldi        | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |
| Zen Browser    | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Downloads:rw |

## Office

| name        | devices    | sockets              | network        | filesystem     |
| ----------- | ---------- | -------------------- | -------------- | -------------- |
| LibreOffice | dri, sound | audio, display       |                | ~/Documents:rw |
| ONLYOFFICE  | dri, sound | audio, display       |                | ~/Documents:rw |
| WPS Office  | dri, sound | audio, display       |                | ~/Documents:rw |
| Obsidian    | dri, sound | dbus, audio, display | CONNECT 80/443 | ~/Notes:rw     |

## CLI

| name    | devices | sockets | network        | filesystem     |
| ------- | ------- | ------- | -------------- | -------------- |
| asdf-vm |         |         | CONNECT 80/443 | ~/Code:rw, ... |
| makepkg |         |         | CONNECT 80/443 | ~/Code:rw, ... |
