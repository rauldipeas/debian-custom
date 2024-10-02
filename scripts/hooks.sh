#!/bin/bash
set -e
cd scripts/hooks
find . -type f -maxdepth 1 -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;
cd am
find . -type f -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;
cd ../apt
find . -type f -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;
mv /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/00-am.sh.hook.chroot
mv /tmp/debian-custom/config/hooks/normal/apt.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/00-apt.sh.hook.chroot
mv /tmp/debian-custom/config/hooks/normal/alsa-firmware.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/zz-alsa-firmware.sh.hook.chroot
#mv /tmp/debian-custom/config/hooks/normal/apt.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/zz-apt.sh.hook.chroot
mv /tmp/debian-custom/config/hooks/normal/clean-root.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/zz-clean-root.sh.hook.chroot
mv /tmp/debian-custom/config/hooks/normal/custom-user-settings.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/zz-custom-user-settings.sh.hook.chroot
mv /tmp/debian-custom/config/hooks/normal/splash.sh.hook.chroot /tmp/debian-custom/config/hooks/normal/splash.sh.hook.binary