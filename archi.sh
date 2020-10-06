#!/bin/bash

pacman -Sy

fdisk /dev/sda <<EOF
o

n
p
1

+1G
n
p
2


w
EOF

#read -p "Computer Name: " hostname
#read -p "User Name: " username

#echo "Set Up Computer Name and Time Zone"
#echo $hostname > /etc/hostname
#ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
