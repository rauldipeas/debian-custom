#!/bin/bash
set -e
wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/debian-mac-style.zip
unzip debian-mac-style.zip
rm debian-mac-style.zip
sudo cp -R debian-mac-style /usr/share/plymouth/themes/
rm -r debian-mac-style
sudo plymouth-set-default-theme -R debian-mac-style
sudo update-initramfs -u