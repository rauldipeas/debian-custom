#!/bin/bash
set -e
wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/debian-mac-style.zip
unzip debian-mac-style.zip
rm debian-mac-style.zip
sudo -A cp -R debian-mac-style /usr/share/plymouth/themes/
rm -r debian-mac-style
sudo -A plymouth-set-default-theme debian-mac-style
sudo -A update-initramfs -u