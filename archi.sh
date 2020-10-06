#!/bin/bash

pacman -Sy
cfdisk /dev/sda

# Format partitions and enable swap
mkfs.ext4 /dev/sda2
mkswap /dev/sda1 -L swap
swapon /dev/sda1
mount /dev/sda2 /mnt

# Install system to mount
pacstrap /mnt base base-devel linux linux-firmware

genfstab -pU /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 
locale-gen

hwclock --systohc --utc

pacman -S grub --noconfirm

echo 'Раскомментируем репозиторий multilib Для работы 32-битных приложений в 64-битной системе.'
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
pacman -Syy




#read -p "Computer Name: " hostname
#read -p "User Name: " username

#echo "Set Up Computer Name and Time Zone"
#echo $hostname > /etc/hostname
#ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
