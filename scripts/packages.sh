#!/bin/bash
set -e
wget -qO /tmp/debian-custom/config/package-lists/desktop.list.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/desktop-packages.list
cd /tmp/debian-custom/config/packages.chroot
#atuin
wget -cq --show-progress "$(wget -qO- https://api.github.com/repos/ellie/atuin/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"
dpkg-name atuin*.deb
#sparkleshare
#wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/libappindicator3-0.1-cil_12.10.0+git20151221-5.1_amd64.deb
#wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/libwebkit2-sharp-4.0-cil_2.10.9+git20160917-1.1_amd64.deb
#wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/sparkleshare_3.28+git20190525+cf446c0-3_all.deb