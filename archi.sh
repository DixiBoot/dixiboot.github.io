#!/bin/bash

pacman -Sy

#(
#	echo d
#echo 1 # Delete Partition 1
#	echo d
#	echo 2
#	echo d
#	echo 3
#	echo d
#	echo o # Create a new empty DOS partition table
#	
#	echo w
#) | fdisk /dev/sda

fdisk /dev/sda <<EOF
o

n
p
1
w
EOF

#read -p "Computer Name: " hostname
#read -p "User Name: " username

#echo "Set Up Computer Name and Time Zone"
#echo $hostname > /etc/hostname
#ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
