#!/bin/bash
set -e
wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/compressed/debian-1080p.zip
sudo unzip debian-1080p.zip -d /usr/share/grub/themes/dark-matter
rm debian-1080p.zip
cat <<EOF |sudo tee /etc/default/grub.d/theme.cfg>/dev/null
GRUB_THEME="/usr/share/grub/themes/dark-matter/theme.txt"
EOF