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
mkdir -p /etc/skel/.local/share/gnome-shell
mv /root/.local/share/gnome-shell/extensions /etc/skel/.local/share/gnome-shell/
rm -rf "$HOME"/.*