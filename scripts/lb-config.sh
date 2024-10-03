#!/bin/bash
set -e
cd /tmp/debian-custom
lb config\
	--apt-repo 'deb https://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware'\
	--apt-repo 'deb https://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware'\
	--apt-repo 'deb https://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware'\
	--apt-repo 'deb https://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware'\
	--apt-source-archives false\
	--architectures amd64\
	--backports true\
	--bootappend-live 'boot=live components cpufreq.default_governor=performance mitigations=off preempt=full quiet splash threadirqs zswap.enabled=1 zswap.compressor=lz4 zswap.max_pool_percent=20 zswap.zpool=z3fold'\
	--chroot-squashfs-compression-type xz\
	--compression xz\
	--debconf-frontend noninteractive\
	--debian-installer none\
	--debian-installer-distribution bookworm\
	--distribution bookworm\
	--grub-splash '/usr/share/grub/themes/starfield/starfield.png'\
	--image-name debian-custom\
	--iso-application 'Debian Custom'\
	--iso-publisher 'Debian Custom; https://rauldipeas.surge.sh/debian-custom; debian-custom.rauldipeas@lock.email'\
	--iso-volume 'Debian Custom'\
	--system live