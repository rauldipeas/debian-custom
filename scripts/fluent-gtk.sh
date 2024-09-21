#!/bin/bash
set -e
sudo -A apt install -y sassc
git clone https://github.com/vinceliuice/Fluent-gtk-theme
cd Fluent-gtk-theme
sudo ./install.sh\
    --color dark\
    --icon debian\
    --tweaks blur
cd ..
rm -r Fluent-gtk-theme
sudo -A apt autoremove --purge -y sassc
sudo -A ln -s /usr/share/themes/Fluent-Dark-compact/gtk-4.0 /etc/skel/.config/gtk-4.0