pacman -Syy
pacman -Su
pacman -S alsa-utils xorg-server xorg-server-utils xorg-xinit virtualbox-guest-utils xorg-twm xorg-xclock xterm --noconfirm
modprobe -a vboxguest vboxsf

pacman -S base-devel abs dmenu --noconfirm
abs community/dwm
cp -r /var/abs/community/dwm ~/dwm
cd ~/dwm
makepkg -i
echo "exec dwm" > .xinitrc