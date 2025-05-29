#!/usr/bin/env bash
#
# THIS FILE IS PART OF HAKONIWA.D
#
# HAKONIWA.D: https://github.com/souk4711/hakoniwa.d
# SPDX-License-Identifier: GPL-3.0-only


sed -i -e 's/Exec=\/bin\//Exec=/g' /usr/share/applications/*.desktop
sed -i -e 's/Exec=\/usr\/bin\//Exec=/g' /usr/share/applications/*.desktop
sed -i -e 's/Exec=\/usr\/lib\/firefox\//Exec=/g' /usr/share/applications/firefox.desktop 2>/dev/null || true
