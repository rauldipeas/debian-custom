#!/bin/bash
set -e
cat <<EOF |sudo tee /etc/default/grub.d/theme.cfg>/dev/null
GRUB_THEME="/usr/share/grub/themes/starfield/theme.txt"
EOF