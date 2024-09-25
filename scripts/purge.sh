#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    "*im-config*"\
    network-manager-gnome\
    pipewire-pulse\
    "*yelp*"