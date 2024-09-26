#!/bin/bash
set -e
find . -name "*splash*" -delete
wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/compressed/debian-1080p.zip
sudo unzip debian-1080p.zip -d boot/grub/dark-matter-theme
rm debian-1080p.zip
#sudo sed -i 's@/boot/grub/live-theme/theme.txt@/boot/grub/dark-matter-theme/theme.txt@g' boot/grub/theme.cfg
cat <<EOF |sudo tee boot/grub/theme.cfg
set color_normal=light-gray/black
set color_highlight=white/dark-gray
set theme=/boot/grub/dark-matter-theme/theme.txt
EOF