#!/bin/bash
set -e
find . -name "*splash*" -delete
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/Coopydood/HyperFluent-GRUB-Theme/releases|grep browser_download_url|grep debian|head -n1|cut -d '"' -f4)"
sudo unzip hyperfluent-debian.tar.gz -d boot/grub/hyperfluent-theme
rm hyperfluent-debian.tar.gz
#sudo sed -i 's@/boot/grub/live-theme/theme.txt@/boot/grub/hyperfluent-theme/theme.txt@g' boot/grub/theme.cfg
cat <<EOF |sudo tee boot/grub/theme.cfg
set color_normal=light-gray/black
set color_highlight=white/dark-gray
set theme=/boot/grub/hyperfluent-theme/theme.txt
EOF