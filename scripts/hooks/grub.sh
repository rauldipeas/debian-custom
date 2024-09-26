#!/bin/bash
set -e
cat <<EOF |sudo tee /etc/defaults/grub.d/theme.cfg
GRUB_THEME="/usr/share/grub/themes/starfield/theme.txt"
EOF