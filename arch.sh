#!/bin/bash

# Update the system
sudo pacman -Syu -y

# install following packages
sudo pacman -S vim tldr speedtest-cli tmux ranger ncdu htop flameshot -y 

# Check if yay is installed
package=yay

if pacman -Qs $package > /dev/null; then
	git clone https://aur.archlinux.org/yay.git
	cd yay
	sudo pacman -S base-devel
	makepkg -si
	cd ..
	rm -rf yay
else
	echo "yay is already installed...."
fi
