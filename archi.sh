#!/bin/bash
read -p "Computer Name: " hostname
read -p "User Name: " username

echo 'Set Up Computer Name and Time Zone'
echo $hostname > /etc/hostname
ln -svf /usr/share/zoneinfo/Europe/Minsk /etc/localtime
