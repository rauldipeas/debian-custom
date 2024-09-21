#!/bin/bash
set -e
sudo apt install -y	libfuse2
mkdir -p /opt/Applications
wget -cq --show-progress -O /opt/Applications/zen-generic.AppImage "$(wget -qO- https://api.github.com/repos/zen-browser/desktop/releases|grep browser_download_url|grep generic.AppImage|head -n1|cut -d '"' -f4)"
chmod +x /opt/Applications/zen-generic.AppImage
ln -s /opt/Applications/zen-generic.AppImage /usr/bin/zen
wget -q --show-progress -O /usr/share/applications/zen.desktop https://github.com/zen-browser/desktop/raw/main/AppDir/zen.desktop
wget -q --show-progress -O /usr/share/icons/zen.png https://github.com/zen-browser/desktop/raw/configs/branding/alpha/logo128.png