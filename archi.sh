#!/bin/bash

pacman -Sy
# sfdisk --delete /dev/sda # Remove all partition

# Or use
dd if=/dev/zero of=/dev/sda bs=1 count=64 seek=446 conv=notrunc
# dd -This standard command copies bytes from the source and writes them to the destination.

fdisk /dev/sda <<EOF
o

n
p
1

+1G
n
p
2


t
1
82

a
2
w
EOF

# Format partitions and enable swap
mkswap /dev/sda1 -L swap
mkfs.ext4 /dev/sda2 -L root

# Mount partitions
mount /dev/sda2 /mnt
swapon /dev/sda1

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
