#!/bin/bash
set -e
sudo apt install -o Dpkg::Options::="--force-confold" --no-install-recommends --force-yes -y calamares calamares-settings-debian
sudo sed -i 's/pkexec/sudo -E/g' /usr/bin/install-debian
sudo sed -i 's/calamares-settings-debian/calamares/g' /etc/calamares/modules/packages.conf
sudo sed -i 's/1/2/g' /etc/calamares/modules/welcome.conf
sudo sed -i 's/true/false/g' /etc/calamares/modules/welcome.conf
cat <<EOF | sudo tee /usr/share/applications/install-debian.desktop>/dev/null
[Desktop Entry]
Type=Application
Version=1.0
Name=Install Debian Custom
GenericName=Calamares Installer
Exec=install-debian
Comment=Calamares — Installer for Debian Custom Live
Keywords=calamares;system;install;debian;installer
Icon=calamares
Terminal=false
Categories=Qt;System;
StartupWMClass=calamares
StartupNotify=True
EOF