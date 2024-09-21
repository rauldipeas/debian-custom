#!/bin/bash
set -e
sudo mkdir -p /opt/custom-user-settings
wget -qO /opt/custom-user-settings/dconf.user https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf.user
cat <<EOF |sudo tee /etc/profile.d/custom-user-settings.sh
if [ -f \"\$HOME\"/.config/dconf/user ];then
    echo 'dconf.user encontrado'
    else
    wget -qO /opt/custom-user-settings/dconf.user https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf.user
    mkdir -p \"\$HOME\"/.config/dconf
    cp /opt/custom-user-settings/dconf.user \"\$HOME\"/.config/dconf/user
fi
if [ -d \"\$HOME\"/.local/share/gnome-shell/extensions ];then
    echo 'gnome-shell-extensions encontrado'
    else
    mkdir -p \"\$HOME\"/.local/share/
    cp -r /opt/custom-user-settings/gnome-shell \"\$HOME\"/.local/share/
fi
if [ -d \"\$HOME\"/.config/gtk-4.0 ];then
    echo 'gtk-4.0 encontrado'
    else
    mkdir -p \"\$HOME\"/.config
    ln -s /usr/share/themes/Fluent-Dark-compact/gtk-4.0 \"\$HOME\"/.config/gtk-4.0
fi
export QT_QPA_PLATFORMTHEME=gtk2
EOF