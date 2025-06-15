# Applications

This document lists all available applications and their respective permissions. The
meaning of the permissions used in the tables is explained below:

- **devices**
  - **dri:** Direct Rendering Infrastructure, includes `/dev/dri`, `/dev/nvidia*`
  - **snd:** Sound input and output, includes `/dev/snd`
  - **v4l:** Video capture devices, such as webcams
- **sockets**
  - **display:** Display server, includes Wayland, X11
  - **audio:** Audio servers, includes PipeWire, PulseAudio
  - **dbus:** D-Bus buses, includes the system bus and the session bus
- **network**
  - **CONNECT:** Allow outgoing connections on PORT
  - **BIND:** Allow incoming connections on PORT

## Desktop Standalone App

| name        | category        | devices  | sockets              | network | filesystem |
| ----------- | --------------- | -------- | -------------------- | ------- | ---------- |
| Arianna     | Document Viewer | dri, snd | display, audio, dbus |         | ~:ro       |
| Evince      | Document Viewer | dri, snd | display, audio, dbus |         | ~:ro       |
| Foliate     | Document Viewer | dri, snd | display, audio, dbus |         | ~:ro       |
| MuPDF       | Document Viewer | dri, snd | display, audio, dbus |         | ~:ro       |
| Okular      | Document Viewer | dri, snd | display, audio, dbus |         | ~:ro       |
| Zathura     | Document Viewer | dri, snd | display, audio, dbus |         | ~:ro       |
| Amberol     | Music Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| Decibels    | Music Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| Elisa       | Music Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| GNOME Music | Music Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| Juk         | Music Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| Dargon      | Video Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| MPlayer     | Video Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| mpv         | Video Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| SMPlayer    | Video Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| Totem       | Video Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| VLC         | Video Player    | dri, snd | display, audio, dbus |         | ~:ro       |
| Ark         | Archive Manager | dri, snd | display, audio, dbus |         | ~:rw       |
| Gwenview    | Image Editor    | dri, snd | display, audio, dbus |         | ~:rw       |
| Loupe       | Image Editor    | dri, snd | display, audio, dbus |         | ~:rw       |
| LibreOffice | Office          | dri, snd | display, audio, dbus |         | ~:rw       |
| ONLYOFFICE  | Office          | dri, snd | display, audio, dbus |         | ~:rw       |
| WPS Office  | Office          | dri, snd | display, audio, dbus |         | ~:rw       |

## Desktop Web App

| name           | category          | devices       | sockets              | network                          | filesystem     |
| -------------- | ----------------- | ------------- | -------------------- | -------------------------------- | -------------- |
| EuSoft Eudic   | Dictionary        | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               |                |
| GoldenDict     | Dictionary        | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               |                |
| Obsidian       | Note Taking       | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               | ~/Notes:rw     |
| FeelUOwn       | Music Player      | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               |                |
| GNOME Podcasts | Podcast Client    | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               |                |
| gPodder        | Podcast Client    | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               |                |
| Kasts          | Podcast Client    | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               |                |
| Brave          | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Chromium       | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Epiphany       | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Falkon         | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Firefox        | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Floorp         | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Google Chrome  | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Konqueror      | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| LibreWolf      | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Microsoft Edge | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Pale Moon      | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| qutebrowser    | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Vivaldi        | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Zen Browser    | Browser           | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| KGet           | Downloader        | dri, snd      | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| Fragments      | Bittorrent Client | dri, snd      | display, audio, dbus | CONNECT TCP 80/443, BIND TCP ANY | ~/Downloads:rw |
| KTorrent       | Bittorrent Client | dri, snd      | display, audio, dbus | CONNECT TCP 80/443, BIND TCP ANY | ~/Downloads:rw |
| qBittorrent    | Bittorrent Client | dri, snd      | display, audio, dbus | CONNECT TCP 80/443, BIND TCP ANY | ~/Downloads:rw |
| Transmission   | Bittorrent Client | dri, snd      | display, audio, dbus | CONNECT TCP 80/443, BIND TCP ANY | ~/Downloads:rw |
| Tencent QQ     | Messager          | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |
| WeChat         | Messager          | dri, snd, v4l | display, audio, dbus | CONNECT TCP 80/443               | ~/Downloads:rw |

## CLI APP

| name    | category | devices | sockets | network                          | filesystem                |
| ------- | -------- | ------- | ------- | -------------------------------- | ------------------------- |
| asdf-vm | Devkit   |         |         | CONNECT TCP 80/443, BIND TCP ANY | ~/Code:rw, ~/Downloads:rw |
| mise    | Devkit   |         |         | CONNECT TCP 80/443, BIND TCP ANY | ~/Code:rw, ~/Downloads:rw |
| makepkg | Devkit   |         |         | CONNECT TCP 80/443, BIND TCP ANY | ~/Code:rw, ~/Downloads:rw |
