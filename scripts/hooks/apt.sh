#!/bin/bash
set -e
cat <<EOF |sudo tee /etc/apt/apt.conf.d/100keep-edited-files
Dpkg::Options {
   "--force-confdef";
   "--force-confold";
}
EOF