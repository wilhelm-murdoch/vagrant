rm -R /home/terry

pacman -Syy
pacman -Su
pacman -S alsa-utils xorg-server xorg-server-utils xorg-xinit virtualbox-guest-utils xorg-twm xorg-xclock xterm --noconfirm
modprobe -a vboxguest vboxsf

pacman -S base-devel abs dmenu --noconfirm
abs community/dwm
cp -r /var/abs/community/dwm /home/vagrant/dwm
cd /home/vagrant/dwm
makepkg -i --asroot --noconfirm
cd ..
echo "exec dwm" > .xinitrc
chown -R vagrant:vagrant /home/vagrant