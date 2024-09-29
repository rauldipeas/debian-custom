#!/bin/bash
set -e
#sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm3/daemon.conf
sudo rm\
    /usr/share/xsessions/lightdm-xsession.desktop\
    /usr/share/wayland-sessions/gnome.desktop
sudo ln -s /dev/null /usr/share/xsessions/lightdm-xsession.desktop
sudo ln -s /dev/null /usr/share/wayland-sessions/gnome.desktop