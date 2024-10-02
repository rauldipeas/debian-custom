#!/bin/bash
set -e
sudo dpkg --add-architecture i386
cat <<EOF |sudo tee /etc/apt/apt.conf.d/100keep-edited-files>/dev/null
Dpkg::Options {
   "--force-confdef";
   "--force-confold";
}
EOF
cat <<EOF |sudo tee /etc/apt/sources.list
# See https://wiki.debian.org/SourcesList for more information.
deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
#deb-src http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware

deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
#deb-src http://deb.debian.org/debian bookworm-updates contrib non-free main non-free-firmware

deb http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
#deb-src http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware

# Backports allow you to install newer versions of software made available for this release
deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware
#deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware
EOF
sudo apt update