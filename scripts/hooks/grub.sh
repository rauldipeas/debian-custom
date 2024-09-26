#!/bin/bash
set -e
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/Coopydood/HyperFluent-GRUB-Theme/releases|grep browser_download_url|grep debian|head -n1|cut -d '"' -f4)"
sudo unzip hyperfluent-debian.tar.gz -d /usr/share/grub/themes/hyperfluent
rm hyperfluent-debian.tar.gz
cat <<EOF |sudo tee /etc/default/grub.d/theme.cfg>/dev/null
GRUB_THEME="/usr/share/grub/themes/hyperfluent/theme.txt"
EOF