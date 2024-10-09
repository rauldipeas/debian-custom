#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    "*apache*\
    "gdm3*"\
    gnome-remote-desktop\
    "*im-config*"\
    network-manager-gnome\
    pipewire-pulse\
    rygel\
    wireplumber\
    "*yelp*"