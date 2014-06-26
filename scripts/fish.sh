# rm -R /home/terry

# pacman -Syy
# pacman -Su
# pacman -S alsa-utils xorg-server xorg-server-utils xorg-xinit virtualbox-guest-utils xorg-twm xorg-xclock xterm --noconfirm
# modprobe -a vboxguest vboxsf

# pacman -S base-devel abs dmenu --noconfirm
# abs community/dwm
# cp -r /var/abs/community/dwm /home/vagrant/dwm
# cd /home/vagrant/dwm
# makepkg -i --asroot --noconfirm
# cd ..
# echo "exec dwm" > .xinitrc


# pacman -S ttf-inconsolata --noconfirm

# echo "*faceName: Inconsolata
# *faceSize: 11
# *background: #0d1926
# *foreground: #d9e6f2
# *color0: #000000
# *color8: #262626
# *color1: #b87a7a
# *color9: #dbbdbd
# *color2: #7ab87a
# *color10: #bddbbd
# *color3: #b8b87a
# *color11: #dbdbbd
# *color4: #7a7ab8
# *color12: #bdbddb
# *color5: #b87ab8
# *color13: #dbbddb
# *color6: #7ab8b8
# *color14: #bddbdb
# *color7: #d9d9d9
# *color15: #ffffff" > .Xdefaults

chown -R vagrant:vagrant /home/vagrant

# pacman -S fish --noconfirm
# chsh -s /usr/bin/fish
