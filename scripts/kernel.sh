#!/bin/bash
set -e
sudo apt autoremove --purge -y linux-image* linux-headers*
sudo apt install -y -t trixie-backports linux-headers-amd64 linux-image-amd64