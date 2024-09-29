#!/bin/bash
set -e
sudo sed -i 's@#background=@background=/usr/share/backgrounds/gnome/blobs-d.svg@g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#icon-theme-name=/icon-theme-name=Papirus-Dark/g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#theme-name=/theme-name=Fluent-Dark-compact/g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#font-name=/font-name=Quicksand 11/g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#indicators=/indicators=~clock;~spacer;~session;~a11y;~power/g' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#greeter-hide-users/greeter-hide-users/g' /etc/lightdm/lightdm.conf
#sudo sed -i 's/#user-session=default/user-session=gnome-xorg/g' /etc/lightdm/lightdm.conf