#!/bin/bash
set -e
pipx install gnome-extensions-cli --system-site-packages
#arcmenu
"$HOME"/.local/bin/gext install arcmenu@arcmenu.com
#blur my shell
"$HOME"/.local/bin/gext install blur-my-shell@aunetx
#emoji copy
"$HOME"/.local/bin/gext install emoji-copy@felipeftn
#forge
"$HOME"/.local/bin/gext install forge@jmmaranan.com
#pano
"$HOME"/.local/bin/gext install pano@elhan.io
#status area horizontal spacing
"$HOME"/.local/bin/gext install status-area-horizontal-spacing@mathematical.coffee.gmail.com
#user themes
"$HOME"/.local/bin/gext install user-theme@gnome-shell-extensions.gcampax.github.com
mkdir -p /opt/custom-user-settings/gnome-shell
mv /root/.local/share/gnome-shell/extensions /opt/custom-user-settings/gnome-shell/