#!/usr/bin/env bash

sed -i -e 's/Exec=\/bin\//Exec=/g' /usr/share/applications/*.desktop
sed -i -e 's/Exec=\/usr\/bin\//Exec=/g' /usr/share/applications/*.desktop
sed -i -e 's/Exec=\/usr\/lib\/firefox\//Exec=/g' /usr/share/applications/firefox.desktop 2>/dev/null || true
