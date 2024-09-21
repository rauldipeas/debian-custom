#!/bin/bash
set -e
wget -q --show-progress "$(wget -qO- https://api.github.com/repos/topgrade-rs/topgrade/releases|grep browser_download_url|grep linux-gnu.tar.gz|grep x86_64|head -n1|cut -d '"' -f4)"
sudo tar -xf topgrade*.tar.gz -C /usr/bin/
rm topgrade*.tar.gz