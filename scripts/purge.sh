#!/bin/bash
set -e
sudo -A apt autoremove --purge -y\
    "*im-config*"\
    pipewire-pulse\
    "*yelp*"