#!/bin/bash
set -e
cp scripts/desktop-packages.list /tmp/debian-custom/config/package-lists/desktop.list.chroot
#backports-kernel
mkdir -p /tmp/debian-custom/config/archives
cat <<EOF |tee /tmp/debian-custom/config/archives/backports.list.chroot>/dev/null
deb http://deb.debian.org/debian bookworm-backports main
EOF
cat <<EOF |tee /tmp/debian-custom/config/archives/backports.pref>/dev/null
Package: *
Pin: release n=bookworm-backports
Pin-Priority: -1
EOF
cat <<EOF |tee /tmp/debian-custom/config/package-lists/kernel.list>/dev/null
linux-headers-$(dpkg --print-architecture) -t bookworm-backports
linux-image-$(dpkg --print-architecture) -t bookworm-backports
EOF
cd /tmp/debian-custom/config/packages.chroot
#atuin
wget -cq --show-progress "$(wget -qO- https://api.github.com/repos/ellie/atuin/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"
dpkg-name atuin*.deb
#sparkleshare
#wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/deb/libappindicator3-0.1-cil_12.10.0+git20151221-5.1_amd64.deb
#wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/deb/libwebkit2-sharp-4.0-cil_2.10.9+git20160917-1.1_amd64.deb
#wget -q --show-progress https://github.com/rauldipeas/debian-custom/raw/main/assets/deb/sparkleshare_3.28+git20190525+cf446c0-3_all.deb