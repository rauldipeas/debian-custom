#!/bin/bash
set -e
find . -name "*splash*" -delete
wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/compressed/debian-1080p.zip
sudo unzip debian-1080p.zip -d boot/grub/themes
sudo rm debian-1080p.zip boot/grub/themes/darkmatter-theme.py
sudo sed -i 's/Live system/Debian custom/g' boot/grub/grub.cfg isolinux/live.cfg
sudo sed -i 's/(amd64)//g' boot/grub/grub.cfg isolinux/live.cfg
sudo sed -i 's/(amd64 /(/g' boot/grub/grub.cfg isolinux/live.cfg
cat <<EOF |sudo tee boot/grub/theme.cfg
set color_normal=light-gray/black
set color_highlight=white/dark-gray
set theme=/boot/grub/themes/darkmatter/theme.txt
EOF