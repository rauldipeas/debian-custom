#!/bin/bash
set -e
sudo apt install -y curl
bash <(wget -qO- https://updates.zen-browser.app/appimage.sh|sed 's@~@/etc/skel@g')
sudo apt autoremove --purge -y curl