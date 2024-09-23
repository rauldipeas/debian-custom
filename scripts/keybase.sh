#!/bin/bash
set -e
wget -qO- https://keybase.io/docs/server_security/code_signing_key.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/keybase.gpg>/dev/null
wget -q --show-progress https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
rm ./keybase_amd64.deb