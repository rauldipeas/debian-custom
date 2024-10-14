#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    "*apache*"\
    gnome-icon-theme\
    gnome-remote-desktop\
    "*im-config*"\
    network-manager-gnome\
    pipewire-pulse\
    rygel\
    wireplumber\
    "*yelp*"