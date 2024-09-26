#!/bin/bash
set -e
sudo apt install -y grub-theme-starfield
sudo cp -r /usr/share/grub/themes boot/grub/
sudo sed -i 's@/boot/grub/live-theme/theme.txt@/boot/grub/themes/starfield/theme.txt@g' boot/grub/theme.cfg