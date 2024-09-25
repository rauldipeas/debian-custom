#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    "gdm3*"\
    "*im-config*"\
    network-manager-gnome\
    pipewire-pulse\
    "*yelp*"