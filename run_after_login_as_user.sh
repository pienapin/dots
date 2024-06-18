#!/usr/bin/env bash

cd /tmp
doas ln -s /usr/bin/doas /usr/bin/sudo
echo "installing paru..."
git clone https://aur.archlinux.org/paru-bin.git
cd paru
makepkg -si
cd ..
rm -rf paru

echo "installing dash.."
pacman -S dash
git clone https://aur.archlinux.org/dashbinsh.git
cd dashbinsh
makepkg -si
cd ..
rm -rf dashbinsh

echo "installing doas-sudo-shim..."
git clone https://aur.archlinux.org/doas-sudo-shim-minimal.git
cd doas-sudo-shim-minimal
makepkg -si
cd ..
rm -rf doas-sudo-shim-minimal


cp -r dots/etc /etc
