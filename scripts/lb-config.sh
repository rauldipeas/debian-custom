#!/bin/bash
set -e
cd /tmp/debian-custom
lb config\
	--apt-indices true\
	--apt-source-archives false\
	--architectures amd64\
	--archive-areas 'main contrib non-free non-free-firmware'\
	--backports true\
	--bootappend-live 'boot=live components cpufreq.default_governor=performance mitigations=off preempt=full quiet splash threadirqs zswap.enabled=1'\
	--chroot-squashfs-compression-type xz\
	--color\
	--compression xz\
	--debconf-frontend noninteractive\
	--debian-installer none\
	--debian-installer-distribution bookworm\
	--distribution bookworm\
	--distribution-binary bookworm\
	--distribution-chroot bookworm\
	--grub-splash '/usr/share/grub/themes/starfield/starfield.png'\
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