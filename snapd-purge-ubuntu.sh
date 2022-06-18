#!/bin/bash

# Script for removing snapd from your Ubuntu system

echo "Are you sure you want to remove snap from your system?"
read -p "[Y/n] >> " yn
echo

if [[ $yn =~ ^[Yy]$ ]]
then 
	if dpkg --list | grep snapd > /dev/null; then
		sudo systemctl disable snapd.socket
		sudo rm -rf /var/cache/snapd
		sudo apt-get remove snapd
		rm -rf ~/snap
	else
		echo "snap is not installed in your system"
	fi
else
	exit
fi

echo
echo "Do you want to install flatpak in your system? "
read -p "[Y/n] >> " yn
echo

if [[ $yn =~ ^[Yy]$ ]]
then 
	if dpkg --list | grep flatpak > /dev/null; then
		echo "flatpak is already installed in your system."
		# echo "Press any key to exit"
	else
		sudo apt-get install flatpak
	fi
fi


