#!/bin/bash
set -e
#sudo sed -i 's@#background=@background=/usr/share/backgrounds/gnome/blobs-d.svg@g' /etc/lightdm/lightdm-gtk-greeter.conf
#sudo sed -i 's/#clock-format=/#clock-format=%R/g' /etc/lightdm/lightdm-gtk-greeter.conf
#sudo sed -i 's/#font-name=/font-name=Quicksand 11/g' /etc/lightdm/lightdm-gtk-greeter.conf
#sudo sed -i 's/#icon-theme-name=/icon-theme-name=Papirus-Dark/g' /etc/lightdm/lightdm-gtk-greeter.conf
#sudo sed -i 's/#indicators=/indicators=~clock;~spacer;~session;~a11y;~power/g' /etc/lightdm/lightdm-gtk-greeter.conf
#sudo sed -i 's/#greeter-hide-users/greeter-hide-users/g' /etc/lightdm/lightdm.conf
#sudo sed -i 's/#theme-name=/theme-name=Fluent-Dark-compact/g' /etc/lightdm/lightdm-gtk-greeter.conf
#sudo sed -i 's/#user-session=default/user-session=gnome/g' /etc/lightdm/lightdm.conf
#cat <<EOF |sudo tee /etc/X11/xorg.conf.d/00-touchpad.conf>/dev/null
#Section "InputClass"
#    	Identifier "Touchpad"
#    	MatchIsTouchpad "on"
#    	Driver "libinput"
#    	Option "Tapping" "on"
#    	Option "NaturalScrolling" "on"
#    	Option "HorizTwoFingerScroll" "on"
#    	Option "VertTwoFingerScroll" "on"
#	Option "PalmDetect" "1"
#	Option "PalmMinWidth" "8"
#	Option "PalmMinZ" "100"
#EndSection
#EOF
#sudo sed -i 's@/usr/sbin/gdm3@/usr/sbin/lightdm@g' /etc/X11/default-display-manager
#sudo ln -fs /usr/lib/systemd/system/lightdm.service /etc/systemd/system/display-manager.service