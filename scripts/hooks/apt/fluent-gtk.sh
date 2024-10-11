#!/bin/bash
set -e
sudo apt install -y appstream-utils git ostree sassc
git clone https://github.com/vinceliuice/Fluent-gtk-theme
cd Fluent-gtk-theme
sudo ./install.sh\
    --color dark\
    --icon debian\
    --tweaks blur
cd ..
git clone https://github.com/refi64/stylepak
stylepak/stylepak install-system Fluent-Dark-compact
rm -r Fluent-gtk-theme stylepak
sudo apt autoremove --purge -y appstream-utils git ostree sassc