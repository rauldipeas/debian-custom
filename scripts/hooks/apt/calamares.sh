#!/bin/bash
set -e
sudo apt install -o Dpkg::Options::="--force-confold" --no-install-recommends -y calamares calamares-settings-debian
sudo sed -i 's/pkexec/sudo -E/g' /usr/bin/install-debian
sudo sed -i 's/calamares-settings-debian/calamares/g' /etc/calamares/modules/packages.conf
sudo sed -i 's/1/2/g' /etc/calamares/modules/welcome.conf
sudo sed -i 's/true/false/g' /etc/calamares/modules/welcome.conf
sudo sed -i 's/main non-free-firmware/contrib main non-free non-free-fimware/g' /usr/sbin/sources-final
sudo sed -i 's/deb-src/#deb-src/g' /usr/sbin/sources-final
cat <<EOF |sudo tee /etc/calamares/modules/locale.conf>/dev/null
geoip:
    style:    "json"
    url:      "https://geoip.kde.org/v1/calamares"
    selector: ""  # leave blank for the default
EOF
cat <<EOF |sudo tee /etc/calamares/modules/partition.conf>/dev/null
userSwapChoices:
    - none      # Create no swap, use no swap
    - file      # To swap file instead of partition
initialSwapChoice: file
availableFileSystemTypes:  ["xfs","btrfs","ext4","f2fs"]
defaultFileSystemType: "xfs"
EOF
#cat <<EOF |sudo tee -a /etc/calamares/settings.conf
#script:
#    - command: "sudo sed -i 's/gnome/gnome-xorg/g' /etc/lightdm/lightdm.conf"
#      timeout: 180
#EOF