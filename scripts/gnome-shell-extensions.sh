#!/bin/bash
set -e
pipx install gnome-extensions-cli --system-site-packages
#blur my shell
"$HOME"/.local/bin/gext install blur-my-shell@aunetx
mkdir -p /etc/skel/.local/share/gnome-shell
mv /root/.local/share/gnome-shell/extensions /etc/skel/.local/share/gnome-shell/
rm -rf "$HOME"/.*