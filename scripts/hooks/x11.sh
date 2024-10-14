#!/bin/bash
set -e
sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm3/daemon.conf
#sudo rm\
#    /usr/share/xsessions/lightdm-xsession.desktop\
#    /usr/share/wayland-sessions/gnome.desktop
#sudo ln -s /dev/null /usr/share/xsessions/lightdm-xsession.desktop
#sudo ln -s /dev/null /usr/share/wayland-sessions/gnome.desktop
cat <<EOF |sudo tee /etc/X11/xorg.conf.d/00-touchpad.conf>/dev/null
Section "InputClass"
    	Identifier "Touchpad"
    	MatchIsTouchpad "on"
    	Driver "libinput"
    	Option "Tapping" "on"
    	Option "NaturalScrolling" "on"
    	Option "HorizTwoFingerScroll" "on"
    	Option "VertTwoFingerScroll" "on"
	Option "PalmDetect" "1"
	Option "PalmMinWidth" "8"
	Option "PalmMinZ" "100"
EndSection
EOF