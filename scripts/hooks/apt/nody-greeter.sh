#!/bin/bash
set -e
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/JezerM/nody-greeter/releases|grep browser_download_url|grep debian.deb|head -n1|cut -d '"' -f4)"
sudo apt install -y ./nody-greeter*.deb
sudo rm nody-greeter*.deb /usr/share/applications/nody-greeter.desktop
sudo sed -i 's/greeter-session=lightdm-gtk-greeter/greeter-session=nody-greeter/g' /etc/lightdm/lightdm.conf
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/hertg/lightdm-neon/releases|grep browser_download_url|grep tar.gz|head -n1|cut -d '"' -f4)"
tar -xf build.tar.gz
rm build.tar.gz
sudo mv public /usr/share/web-greeter/themes/neon
sudo sed -i 's/theme: gruvbox/theme: neon/g' /etc/lightdm/web-greeter.yml