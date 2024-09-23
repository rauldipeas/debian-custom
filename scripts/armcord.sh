#!/bin/bash
set -e
wget -qO- https://apt.armcord.app/public.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/armcord.gpg>/dev/null
echo "deb [arch=amd64] https://apt.armcord.app/ stable main"|sudo tee /etc/apt/sources.list.d/armcord.list>/dev/null
sudo apt update
sudo apt install -y armcord