#!/bin/bash
set -e
sudo sed -i 's/start-pulseaudio-x11/systemctl --user start pulseaudio.service/g' /etc/xdg/autostart/pulseaudio.desktop
sudo sed -i 's/Systemd=true/Systemd=false/g' /etc/xdg/autostart/pulseaudio.desktop