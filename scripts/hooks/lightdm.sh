#!/bin/bash
set -e
sudo sed -i 's@#background=@background=/usr/share/backgrounds/gnome/blobs-d.svg@g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's@#icon-theme-name=@icon-theme-name=Papirus-Dark@g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's@#theme-name=@theme-name=Fluent-Dark-compact@g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's@#font-name=@font-name=Quicksand 11@g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's@#font-name=@font-name=Quicksand 11@g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo mkdir -p /etc/lightdm/lightdm.conf.d
cat <<EOF |sudo tee /etc/lightdm/lightdm.conf.d/user-session.conf>/dev/null
[SeatDefaults]
user-session=gnome-xorg
EOF