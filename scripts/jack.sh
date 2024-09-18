#!/bin/bash
set -e
echo 'jackd2 jackd/tweak_rt_limits string true'|sudo -A debconf-set-selections
cat <<EOF |sudo -A tee /etc/apt/preferences.d/qjackctl.pref>/dev/null
Package: qjackctl
Pin: release a=*
Pin-Priority: -10
EOF
sudo -A apt install -y jackd2
sudo -A rm /etc/apt/preferences.d/qjackctl.pref
fi