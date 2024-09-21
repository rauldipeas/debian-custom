#!/bin/bash
set -e
cd /tmp/debian-custom
sudo lb build #2>&1|tee /tmp/build-debian-custom.log