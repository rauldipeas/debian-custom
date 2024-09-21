#!/bin/bash
set -e
sudo apt autoremove --purge -y\
    "*im-config*"\
    pipewire-pulse\
    "*yelp*"