#!/bin/bash

pacman -Sy
sfdisk --delete /dev/sda # Remove all partition

# Or use
# dd if=/dev/zero of=/dev/sda bs=1 count=64 seek=446 conv=notrunc
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

#read -p "Computer Name: " hostname
#read -p "User Name: " username

#echo "Set Up Computer Name and Time Zone"
#echo $hostname > /etc/hostname
#ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
