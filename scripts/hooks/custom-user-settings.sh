#!/bin/bash
set -e
sudo mkdir -p /opt/custom-user-settings/bash
wget -qO /opt/custom-user-settings/dconf-settings.ini https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf-settings.ini
wget -qO /opt/custom-user-settings/bash/bashrc https://github.com/rauldipeas/debian-custom/raw/main/settings/bash/bashrc
wget -qO /opt/custom-user-settings/bash/bash-preexec.sh https://github.com/rcaloras/bash-preexec/raw/master/bash/bash-preexec.sh
wget -qO /opt/custom-user-settings/bash/atuin.bash https://github.com/rcaloras/bash-preexec/raw/master/bash/atuin.bash
wget -qO /opt/custom-user-settings/bash/liquidprompt.bash https://github.com/rcaloras/bash-preexec/raw/master/bash/liquidprompt.bash
cat <<EOF |sudo tee /etc/profile.d/custom-user-settings.sh>/dev/null
if ! [ -d "\$HOME"/.bashrc.d ];then
    mkdir -p "\$HOME"/.bashrc.d
    mv "\$HOME"/.bashrc "\$HOME"/.bashrc.d/rc.bash
    cp /opt/custom-user-settings/bash/bashrc "\$HOME"/.bashrc
    cp /opt/custom-user-settings/bash/*.bash "\$HOME"/.bashrc.d/
    cp /usr/share/liquidprompt/liquidpromptrc-dist "\$HOME"/.config/liquidpromptrc
    sed -i 's/debian.theme/powerline.theme/g' "\$HOME"/.config/liquidpromptrc
fi
if ! [ -f "\$HOME"/.config/dconf/user ];then
    dconf load / < /opt/custom-user-settings/dconf-settings.ini
    sudo dconf load / < /opt/custom-user-settings/dconf-settings.ini
fi
if ! [ -d "\$HOME"/.config/gtk-4.0 ];then
    mkdir -p "\$HOME"/.config
    if [ \$(gsettings get org.gnome.desktop.interface gtk-theme|cut -d \' -f2) = Fluent-Dark-compact ];then
        echo Fluent-Dark-compact selecionado
        ln -s /usr/share/themes/Fluent-Dark-compact/gtk-4.0 "\$HOME"/.config/gtk-4.0
        else
        echo Fluent-Dark-compact não selecionado
    fi
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
sudo chown -R "\$(ls /home)"\
    /opt/am\
    /opt/bat\
    /opt/casterr\
    /opt/fd\
    /opt/freetube\
    /opt/got\
    /opt/mission-center\
    /opt/rustdesk\
    /opt/topgrade\
    /opt/zap\
    /opt/zen-browser\
    /usr/local/share/applications/*-AM.desktop
sudo rm /etc/rc.local
EOF
sudo chmod +x /etc/rc.local
cat <<EOF |sudo tee /usr/local/bin/reset-user-settings>/dev/null
rm -r\
    "\$HOME"/.bashrc.d
    "\$HOME"/.config/dconf/user\
    "\$HOME"/.config/gtk-4.0\
    "\$HOME"/.local/share/gnome-shell/extensions
sudo shutdown -r 0
EOF
sudo chmod +x /usr/local/bin/reset-user-settings