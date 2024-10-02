#!/bin/bash
set -e
sudo apt autoremove --purge -y linux-image* linux-headers*
cat <<EOF |sudo tee /etc/apt/sources.list.d/backports.list>/dev/null
deb http://deb.debian.org/debian bookworm-backports main
EOF
cat <<EOF |tee /etc/apt/preferences.d/backports.pref>/dev/null
Package: *
Pin: release n=bookworm-backports
Pin-Priority: -1
EOF
sudo apt update
sudo apt install -t bookworm-backports -y linux-image-amd64 linux-headers-amd64
sudo rm /etc/apt/sources.list.d/backports.list
sudo apt update