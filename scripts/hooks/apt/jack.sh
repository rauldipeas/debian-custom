#!/bin/bash
set -e
echo 'jackd2 jackd/tweak_rt_limits string true'|sudo debconf-set-selections
cat <<EOF |sudo tee /etc/apt/preferences.d/qjackctl.pref>/dev/null
Package: qjackctl
Pin: release a=*
Pin-Priority: -10
EOF
sudo apt install -y jackd2
sudo rm /etc/apt/preferences.d/qjackctl.pref