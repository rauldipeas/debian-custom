#!/bin/bash
set -e
sudo mkdir -p /opt/custom-user-settings
wget -qO /opt/custom-user-settings/dconf.user https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf.user
cat <<EOF |sudo tee /etc/profile.d/custom-user-settings.sh>/dev/null
if ! [ -f "\$HOME"/.config/dconf/user ];then
    wget -qO /opt/custom-user-settings/dconf.user https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf.user
    mkdir -p "\$HOME"/.config/dconf
    cp /opt/custom-user-settings/dconf.user "\$HOME"/.config/dconf/user
fi
if ! [ -d "\$HOME"/.config/gtk-4.0 ];then
    mkdir -p "\$HOME"/.config
    ln -s /usr/share/themes/Fluent-Dark-compact/gtk-4.0 "\$HOME"/.config/gtk-4.0
fi
if ! [ -d "\$HOME"/.config/systemd/user/pipewire.service ];then
    mkdir -p "\$HOME"/.config/systemd/user
    ln -s /dev/null "\$HOME"/.config/systemd/user/pipewire.service
fi
if ! [ -d "\$HOME"/.local/share/gnome-shell/extensions ];then
    mkdir -p "\$HOME"/.local/share
    cp -r /opt/custom-user-settings/gnome-shell "\$HOME"/.local/share/
fi
export QT_QPA_PLATFORMTHEME=gtk2
EOF
cat <<EOF |sudo tee /etc/rc.local>/dev/null
#!/bin/bash
set -e
sudo chown -R -v "\$(ls /home)"\
    /opt/am\
    /opt/freetube\
    /opt/rustdesk\
    /opt/topgrade\
    /opt/zen-browser\
    /usr/local/share/applications/*-AM.desktop
echo y|am --icons --all
sudo rm /etc/rc.local
EOF
sudo chmod +x /etc/rc.local
cat <<EOF |sudo tee /usr/local/bin/reset-user-settings>/dev/null
rm -r\
    "\$HOME"/.config/dconf/user\
    "\$HOME"/.config/gtk-4.0\
    "\$HOME"/.local/share/gnome-shell/extensions
sudo shutdown -r 0
EOF
sudo chmod +x /usr/local/bin/reset-user-settings