#!/bin/bash
set -e
"$(cd scripts/hooks;find . -name *.sh -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;)"
"$(cd /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot;mv am.sh.hook.chroot 00-am.sh.hook.chroot)"
"$(cd /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot;mv alsa-firmware.sh.hook.chroot zz-alsa-firmware.sh.hook.chroot)"
"$(cd /tmp/debian-custom/config/hooks/normal/am.sh.hook.chroot;mv clean-root.sh.hook.chroot zz-clean-root.sh.hook.chroot)"
"$(cd scripts/hooks/am;find . -name *.sh -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;)"
"$(cd scripts/hooks/apt;find . -name *.sh -printf "%f\n" -exec cp {} /tmp/debian-custom/config/hooks/normal/{}.hook.chroot \;)"