#!/bin/bash
set -e
# audio group
cat <<EOF |sudo -A tee -a /etc/adduser.conf>/dev/null
ADD_EXTRA_GROUPS=1
EXTRA_GROUPS="audio"
EOF
# swappiness
cat <<EOF |sudo -A tee -a /etc/sysctl.d/swappiness.conf>/dev/null
vm.swappiness = 10
EOF
# zswap
cat <<EOF |sudo -A tee /etc/default/grub.d/rtcqs.cfg>/dev/null
GRUB_CMDLINE_LINUX_DEFAULT="cpufreq.default_governor=performance loglevel=3 mitigations=off preempt=full quiet rd.udev.log_level=3 splash threadirqs zswap.enabled=1 zswap.compressor=lz4"
EOF
#sudo -A update-grub
cat <<EOF |sudo -A tee -a /etc/initramfs-tools/modules>/dev/null
echo lz4
echo lz4_compress
EOF
sudo -A update-initramfs -u -k all
# cpu-dma-latency
wget -qO- https://raw.githubusercontent.com/Ardour/ardour/master/tools/udev/99-cpu-dma-latency.rules|sudo -A tee /etc/udev/rules.d/99-cpu-dma-latency.rules