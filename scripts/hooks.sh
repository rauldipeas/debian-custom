#!/bin/bash
set -e
find scripts/hooks -type f -maxdepth 1 -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;
"$(cd /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot;mv am.sh.hook.chroot 00-am.sh.hook.chroot)"
"$(cd /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot;mv alsa-firmware.sh.hook.chroot zz-alsa-firmware.sh.hook.chroot)"
"$(cd /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot;mv clean-root.sh.hook.chroot zz-clean-root.sh.hook.chroot)"
find scripts/hooks/am -type f -maxdepth 1 -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;
find scripts/hooks/apt -type f -maxdepth 1 -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;