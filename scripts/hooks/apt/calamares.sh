#!/bin/bash
set -e
sudo apt install -o Dpkg::Options::="--force-confold" --no-install-recommends -y calamares calamares-settings-debian
sudo sed -i 's/pkexec/sudo -E/g' /usr/bin/install-debian
#sudo sed -i 's/calamares-settings-debian/calamares/g' /etc/calamares/modules/packages.conf
sudo sed -i 's/1/2/g' /etc/calamares/modules/welcome.conf
sudo sed -i 's/true/false/g' /etc/calamares/modules/welcome.conf
sudo sed -i 's/main non-free-firmware/contrib main non-free non-free-firmware/g' /usr/sbin/sources-final
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
availableFileSystemTypes:  ["xfs","ext4","f2fs"]
defaultFileSystemType: "xfs"
EOF
cat <<EOF |sudo tee /usr/sbin/gpu-driver
#!/bin/bash
set -e
if [ "\$(cut -d' ' -f9 <(grep NVIDIA <(sudo lshw -C display)))" == NVIDIA ];then
    sudo apt install -y firmware-misc-nonfree nvidia-driver
    echo 'NVIDIA'|sudo tee /etc/skel/.gpu-driver>/dev/null
elif [ "\$(cut -d' ' -f9 <(grep AMD <(sudo lshw -C display)))" == AMD ];then
    echo 'AMD'|sudo tee /etc/skel/.gpu-driver>/dev/null
elif [ "\$(cut -d' ' -f9 <(grep Intel <(sudo lshw -C display)))" == Intel ];then
    echo 'Intel'|sudo tee /etc/skel/.gpu-driver>/dev/null
elif [ "\$(cut -d' ' -f9 <(grep VirtualBox <(sudo lshw -C display)))" == VirtualBox ];then
    echo "deb http://fasttrack.debian.net/debian-fasttrack/ \$(lsb_release -cs)-fasttrack main contrib"|
    sudo tee /etc/apt/sources.list.d/fasttrack.list
    echo "deb http://fasttrack.debian.net/debian-fasttrack/ \$(lsb_release -cs)-backports-staging main contrib"|
    sudo tee -a /etc/apt/sources.list.d/fasttrack.list
    sudo apt install -y fasttrack-archive-keyring
    sudo apt update
    sudo apt install --no-install-recommends -y virtualbox-guest-x11
    echo 'VirtualBox'|sudo tee /etc/skel/.gpu-driver>/dev/null
fi
EOF
sudo chmod +x /usr/sbin/gpu-driver
cat <<EOF |sudo tee -a /etc/calamares/modules/packages.conf
backend: apt

operations:
  - remove:
      - 'live-boot'
      - 'live-boot-doc'
      - 'live-config'
      - 'live-config-doc'
      - 'live-config-systemd'
      - 'live-config-systemd'
      - 'live-tools'
      - 'live-task-localisation'
      - 'live-task-recommended'
      - 'calamares'
  - install:
      - package: lshw
        post-script: /usr/sbin/gpu-driver
EOF