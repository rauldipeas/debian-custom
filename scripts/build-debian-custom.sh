#!/bin/bash
set -e
rm -f debian-archive-keyring*.deb live-build*.deb>/dev/null
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.3+deb12u1_all.deb
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/l/live-build/live-build_20230502_all.deb
sudo apt install -y ./debian-archive-keyring*.deb ./live-build*.deb
sudo rm -rfv /tmp/debian-custom
mkdir -p /tmp/debian-custom
cd /tmp/debian-custom
lb config\
	--apt-indices true\
	--apt-source-archives false\
	--architectures amd64\
	--archive-areas 'main contrib non-free non-free-firmware'\
	--backports true\
	--bootappend-live 'boot=live components cpufreq.default_governor=performance loglevel=3 mitigations=off preempt=full quiet rd.udev.log_level=3 splash threadirqs zswap.enabled=1 zswap.compressor=lz4'\
	--chroot-squashfs-compression-type xz\
	--color\
	--compression xz\
	--debconf-frontend noninteractive\
	--debian-installer none\
	--debian-installer-distribution bookworm\
	--distribution bookworm\
	--distribution-binary bookworm\
	--distribution-chroot bookworm\
	--image-name debian-custom\
	--iso-application 'Debian Custom'\
	--iso-publisher 'Debian Custom; https://rauldipeas.surge.sh/debian-custom; debian-custom.rauldipeas@lock.email'\
	--iso-volume 'Debian Custom'\
	--mirror-bootstrap 'https://deb.debian.org/debian/'\
	--mirror-chroot 'http://deb.debian.org/debian/'\
	--mirror-binary 'http://deb.debian.org/debian/'\
	--parent-distribution-binary bookworm\
	--quiet\
	--system live\
	--updates true
wget -qO config/hooks/normal/calamares.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/calamares.sh
wget -qO config/hooks/normal/cfs-zen-tweaks.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/cfs-zen-tweaks.sh
wget -qO config/hooks/normal/extra-repositories.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/extra-repositories.sh
wget -qO config/hooks/normal/flathub.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/flathub.sh
wget -qO config/hooks/normal/fluent-gtk.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/fluent-gtk.sh
wget -qO config/hooks/normal/gnome-shell-extensions.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/gnome-shell-extensions.sh
#wget -qO config/hooks/normal/grub-settings.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/grub-settings.sh
wget -qO config/hooks/normal/jack.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/jack.sh
wget -qO config/hooks/normal/kernel.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/kernel.sh
wget -qO config/hooks/normal/keybase.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/keybase.sh
wget -qO config/hooks/normal/plymouth.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/plymouth.sh
wget -qO config/hooks/normal/protonvpn.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/protonvpn.sh
wget -qO config/hooks/normal/purge.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/purge.sh
wget -qO config/hooks/normal/rtcqs.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/rtcqs.sh
wget -qO config/hooks/normal/topgrade.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/topgrade.sh
wget -qO config/hooks/normal/virtualbox-x11.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/virtualbox-x11.sh
wget -qO config/hooks/normal/x11.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/x11.sh
wget -qO config/package-lists/desktop.list.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/desktop-packages.list
cd config/packages.chroot
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/FreeTubeApp/FreeTube/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d'"' -f4)"
dpkg-name freetube*.deb
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/s/sparkleshare/sparkleshare_3.28+git20190525+cf446c0-3_all.deb
dpkg-name sparkleshare*.deb
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/w/webkit2-sharp/libwebkit2-sharp-4.0-cil_2.10.9+git20160917-1.1_amd64.deb
dpkg-name libwebkit2-sharp*.deb
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/a/appindicator3-sharp/libappindicator3-0.1-cil_12.10.0+git20151221-5.1_amd64.deb
dpkg-name libappindicator*.deb
cd ../..

#wget -q --show-progress -O dekuve.zip 'https://www.dropbox.com/scl/fi/erhpzghrhpfcubofnnjdm/dekuve.zip?rlkey=advz5obcky8gm2sekumc3n63v&dl=1'
#unzip -q dekuve.zip
#rm dekuve.zip
#mv binary/* config/includes.binary/
#rm -rf binary
#mv chroot config/includes.chroot
#chmod +x config/includes.chroot/usr/local/bin/*
#find config/includes.chroot/ -name "*.sh" -exec chmod +x {} \;

mkdir -p config/includes.chroot/etc/skel/.config/dconf
wget -qO config/includes.chroot/etc/skel/.config/dconf/user https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf.user
sudo lb build 2>&1|tee /tmp/build-debian-custom.log