#!/bin/bash

cp -rf /etc/puppet/files/mirrorlist /etc/pacman.d/mirrorlist

pacman -Su --noconfirm
pacman -Sy --noconfirm
pacman -S puppet virtualbox-guest-utils --noconfirm

modprobe -a vboxguest vboxsf
