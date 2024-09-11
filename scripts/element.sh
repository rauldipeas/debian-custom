#!/bin/bash
set -e
sudo -A apt install -y 
wget -O- https://packages.element.io/debian/element-io-archive-keyring.gpg|sudo -A gpg --dearmor -o /etc/apt/trusted.gpg.d/element-io-archive-keyring.gpg
echo 'deb https://packages.element.io/debian/ default main'|sudo -A tee /etc/apt/sources.list.d/element-io.list
sudo -A apt update
sudo -A apt install -y element-desktop