#!/bin/bash
set -e
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/JezerM/nody-greeter/releases|grep browser_download_url|grep debian.deb|head -n1|cut -d '"' -f4)"
sudo apt install -y build-essential git ./nody-greeter*.deb npm
sudo rm nody-greeter*.deb /usr/share/applications/nody-greeter.desktop
sudo sed -i 's/greeter-session=lightdm-gtk-greeter/greeter-session=nody-greeter/g' /etc/lightdm/lightdm.conf
git clone https://github.com/hertg/lightdm-neon
cd lightdm-neon
make build
sudo make install
cd ..
rm -r lightdm-neon
sudo sed -i 's/theme: gruvbox/theme: neon/g' /etc/lightdm/web-greeter.yml
sudo apt autoremove --purge build-essential git npm