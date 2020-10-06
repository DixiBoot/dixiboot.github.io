#!/bin/bash

pacman -Sy

(
	echo d
	echo 1
	echo d
	echo 2
	echo d
	echo w
) | fdisk /dev/sda

read -p "Computer Name: " hostname
read -p "User Name: " username

echo "Set Up Computer Name and Time Zone"
echo $hostname > /etc/hostname
ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
