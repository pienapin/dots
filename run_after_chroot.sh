#!/usr/bin/env bash

ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc

sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
sed -i 's/#id_ID.UTF-8/id_ID.UTF-8/g' /etc/locale.gen
sed -i 's/#ja_JP.UTF-8/ja_JP.UTF-8/g' /etc/locale.gen
sed -i 's/#ko_KR.UTF-8/ko_KR.UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo onenine >> /etc/hostname
systemctl enable NetworkManager.service

passwd

useradd -mG wheel,video pien
passwd pien

cd /tmp
git clone https://github.com/pienapin/dots.git
pacman -S --needed - < dots/pkgs_build.txt

pacman -S refind
echo "Please enter EFI partition: (example: /dev/sda1 or /dev/nvme0n1p1)"
read EFI
refind-install --usedefault "$(EFI)"
mkrlconf
tail -n 1 /boot/refind_linux.conf > /boot/refind_linux.conf

git clone https://aur.archlinux.org/paru-bin.git
cd paru
makepkg -si
cd ..
rm -rf paru

pacman -S opendoas
cat <<EOF > /etc/doas.conf
permit persist setenv {PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin} :wheel

EOF

pacman -S dash
git clone https://aur.archlinux.org/dashbinsh.git
cd dashbinsh
makepkg -si
cd ..
rm -rf dashbinsh

pacman -R sudo
git clone https://aur.archlinux.org/doas-sudo-shim-minimal.git
cd doas-sudo-shim-minimal
makepkg -si
cd ..
rm -rf doas-sudo-shim-minimal

cp -r dots/etc /etc
cp -r dots/boot /boot
echo "check refind configuration and adjust it based on your system right now."
echo "if done, you can reboot"
