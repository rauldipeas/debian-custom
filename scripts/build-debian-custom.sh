#!/bin/bash
set -e
if [ -f "$HOME"/sudo_askpass ];then
	export SUDO_ASKPASS="$HOME/sudo_askpass"
	echo askpass helper enabled
	else
	echo askpass helper skipped
fi
rm -f debian-archive-keyring*.deb live-build*.deb>/dev/null
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2023.3+deb12u1_all.deb
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/l/live-build/live-build_20230502_all.deb
sudo -A apt install -y ./debian-archive-keyring*.deb ./live-build*.deb
sudo -A rm -rfv /tmp/debian-custom
mkdir -p /tmp/debian-custom
cd /tmp/debian-custom
lb config\
	--apt-indices true\
	--apt-source-archives false\
	--architectures amd64\
	--archive-areas 'main contrib non-free non-free-firmware'\
	--backports true\
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
#wget -qO config/hooks/normal/calamares.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/calamares.sh
#wget -qO config/hooks/normal/extra-repositories.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/extra-repositories.sh
#wget -qO config/hooks/normal/flathub.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/flathub.sh
#wget -qO config/hooks/normal/grub-settings.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/grub-settings.sh
wget -qO config/hooks/normal/kernel.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/kernel.sh
#wget -qO config/hooks/normal/plymouth.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/plymouth.sh
wget -qO config/hooks/normal/virtualbox-x11.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/virtualbox-x11.sh
wget -qO config/hooks/normal/purge.hook.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/purge.sh
wget -qO config/package-lists/desktop.list.chroot https://github.com/rauldipeas/debian-custom/raw/main/scripts/desktop-packages.list
#cd config/packages.chroot

# Element PLACEHOLDER
# FreeTube PLACEHOLDER
# Keybase PLACEHOLDER
# Stremio PLACEHOLDER
# Windscribe PLACEHOLDER

#wget -q --show-progress "$(wget -qO- https://api.github.com/repos/localsend/localsend/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"
#dpkg-name LocalSend*.deb
#cd ../..
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
sudo -A lb build 2>&1|tee /tmp/build-debian-custom.log