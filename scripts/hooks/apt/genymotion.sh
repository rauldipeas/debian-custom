#!/bin/bash
set -e
sudo apt install -y libglu1-mesa libssl1.1
wget -q --show-progress -O /tmp/genymotion.bin "$(wget -qO- https://www.genymotion.com/download|grep linux_x64.bin|head -n 1|cut -d '"' -f4)"
chmod +x /tmp/genymotion.bin
/tmp/genymotion.bin -y
rm /tmp/genymotion.bin