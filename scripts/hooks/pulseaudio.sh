#!/bin/bash
set -e
sed -i 's/start-pulseaudio-x11/systemctl --user start pulseaudio.service/g' /etc/xdg/autostart/pulseaudio.desktop