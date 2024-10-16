#!/bin/bash
set -e
wget -qO /etc/apt/trusted.gpg.d/genymotion.gpg https://dl.genymotion.com/releases/genymotion/gpg.key
echo "deb https://dl.genymotion.com/releases/genymotion/ $(lsb_release -cs) main"|sudo tee /etc/apt/sources.list.d/genymotion.list
sudo apt update
sudo apt install -y genymotion libglu1-mesa libssl1.1