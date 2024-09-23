#!/bin/bash
set -e
systemctl mask pipewire.service pipewire.socket
systemctl disable pipewire.service pipewire.socket
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/pulseaudio.desktop
sudo sed -i 's/Systemd=true/Systemd=false/g' /etc/xdg/autostart/pulseaudio.desktop
sudo sed -i 's/start-pulseaudio-x11/systemctl start pulseaudio.service/g' /etc/xdg/autostart/pulseaudio.desktop