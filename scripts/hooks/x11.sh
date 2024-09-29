#!/bin/bash
set -e
#sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm3/daemon.conf
sudo rm\
    /usr/share/xsessions/gnome.desktop\
    /usr/share/xsessions/lightdm-xsession.desktop\
    /usr/share/wayland-sessions/gnome.desktop
sudo mv /usr/share/wayland-sessions/gnome-wayland.desktop /opt/custom-user-settings/gnome-wayland.desktop
sudo ln -s /dev/null /usr/share/xsessions/gnome.desktop
sudo ln -s /dev/null /usr/share/xsessions/lightdm-xsession.desktop
sudo ln -s /dev/null /usr/share/wayland-sessions/gnome.desktop
sudo ln -s /dev/null /usr/share/wayland-sessions/gnome-wayland.desktop