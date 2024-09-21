#!/bin/bash
set -e
wget https://github.com/ivan-hc/AM/raw/main/INSTALL
chmod +x ./INSTALL
sudo ./INSTALL
rm ./INSTALL