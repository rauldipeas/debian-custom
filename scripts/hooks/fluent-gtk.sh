#!/bin/bash
set -e
sudo apt install -y git sassc
git clone https://github.com/vinceliuice/Fluent-gtk-theme
cd Fluent-gtk-theme
sudo ./install.sh\
    --color dark\
    --icon debian\
    --tweaks blur
cd ..
rm -r Fluent-gtk-theme
sudo apt autoremove --purge -y git sassc