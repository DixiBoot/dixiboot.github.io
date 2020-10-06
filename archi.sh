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
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2

# Mount partitions
mount /dev/sda2 /mnt

# Install system to mount
pacstrap /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
hwclock --systohc --utc


#read -p "Computer Name: " hostname
#read -p "User Name: " username

#echo "Set Up Computer Name and Time Zone"
#echo $hostname > /etc/hostname
#ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
