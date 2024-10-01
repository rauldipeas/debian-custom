#!/bin/bash
set -e
sudo mkdir -p /opt/custom-user-settings/bash
wget -qO /opt/custom-user-settings/bash/bashrc https://github.com/rauldipeas/debian-custom/raw/main/settings/bash/bashrc
wget -qO /opt/custom-user-settings/bash/bash-preexec.sh https://github.com/rcaloras/bash-preexec/raw/master/bash-preexec.sh
wget -qO /opt/custom-user-settings/bash/atuin.bash https://github.com/rauldipeas/debian-custom/raw/main/settings/bash/atuin.bash
wget -qO /opt/custom-user-settings/bash/liquidprompt.bash https://github.com/rauldipeas/debian-custom/raw/main/settings/bash/liquidprompt.bash
wget -qO /opt/custom-user-settings/dconf-settings.ini https://github.com/rauldipeas/debian-custom/raw/main/settings/dconf-settings.ini
wget -qO /opt/custom-user-settings/xscreensaver https://github.com/rauldipeas/debian-custom/raw/main/settings/xscreensaver
cat <<EOF |sudo tee /etc/profile.d/custom-user-settings.sh /etc/X11/Xsession.d/90-custom-user-settings>/dev/null
if ! [ -f "\$HOME"/.custom-user-settings ];then
    #bash
    mkdir -p "\$HOME"/.bashrc.d
    mv "\$HOME"/.bashrc "\$HOME"/.bashrc.d/rc.bash
    cp /opt/custom-user-settings/bash/bashrc "\$HOME"/.bashrc
    cp /opt/custom-user-settings/bash/*.bash "\$HOME"/.bashrc.d/
    cp /opt/custom-user-settings/bash/*.sh "\$HOME"/.bashrc.d/
    cp /usr/share/liquidprompt/liquidpromptrc-dist "\$HOME"/.config/liquidpromptrc
    sed -i 's/debian.theme/powerline.theme/g' "\$HOME"/.config/liquidpromptrc
    #dconf
    dconf load / < /opt/custom-user-settings/dconf-settings.ini
    #gtk-4.0
    mkdir -p "\$HOME"/.config
    if [ \$(gsettings get org.gnome.desktop.interface gtk-theme|cut -d \' -f2) = Fluent-Dark-compact ];then
        ln -fs /usr/share/themes/Fluent-Dark-compact/gtk-4.0 "\$HOME"/.config/gtk-4.0
    fi
    #gnome-shell-extensions
    mkdir -p "\$HOME"/.local/share
    cp -r /opt/custom-user-settings/gnome-shell "\$HOME"/.local/share/
    #pipewire/pulseaudio
    mkdir -p "\$HOME"/.config/systemd
    ln -fs /dev/null "\$HOME"/.config/systemd/pipewire.service
    ln -fs /dev/null "\$HOME"/.config/systemd/pipewire.socket
    touch "\$HOME"/.custom-user-settings
    #xscreensaver
    cp -r /opt/custom-user-settings/xscreensaver "\$HOME"/.xscreensaver
fi
EOF
cat <<EOF |sudo tee /etc/environment.d/90-qt-qpa-platformtheme.conf /etc/profile.d/qt-qpa-platformtheme.sh /etc/X11/Xsession.d/90-qt-qpa-platformtheme>/dev/null
export QT_QPA_PLATFORMTHEME=gtk2
EOF
cat <<EOF |sudo tee /etc/rc.local>/dev/null
#!/bin/bash
set -e
sudo chown -R "\$(ls /home)"\
    /opt/am\
    /opt/bat\
    /opt/casterr\
    /opt/everdo\
    /opt/fd\
    /opt/freetube\
    /opt/got\
    /opt/mission-center\
    /opt/rustdesk\
    /opt/topgrade\
    /opt/zap\
    /opt/zen-browser
sudo rm /etc/rc.local
EOF
sudo chmod +x /etc/rc.local
cat <<EOF |sudo tee /usr/local/bin/reset-user-settings>/dev/null
rm -r "\$HOME"/.custom-user-settings "\$HOME"/.local/share/gnome-shell
sudo shutdown -r 0
EOF
sudo chmod +x /usr/local/bin/reset-user-settings