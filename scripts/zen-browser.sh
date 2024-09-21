#!/bin/bash
set -e
sudo apt install -y	libfuse2
sudo mkdir -p /opt/Applications
sudo wget -cq --show-progress -O /opt/Applications/zen-generic.AppImage "$(wget -qO- https://api.github.com/repos/zen-browser/desktop/releases|grep browser_download_url|grep AppImage|head -n1|cut -d '"' -f4)"
sudo chmod +x -v  /opt/Applications/zen-generic.AppImage
sudo ln -sv /opt/Applications/zen-generic.AppImage /usr/bin/zen
sudo wget -q --show-progress -O /usr/share/applications/zen.desktop https://github.com/zen-browser/desktop/raw/main/AppDir/zen.desktop
sudo wget -q --show-progress -O /usr/share/icons/zen.png https://github.com/zen-browser/desktop/raw/configs/branding/alpha/logo128.png