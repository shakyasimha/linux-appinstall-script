#!/bin/bash

# For initial update and installing packages, after system reinstall
# Packages that I need which I need to install every time:
# vim
# zsh
# Brave browser
# Discord
# VS Code
# Virtualbox 
# qbittorrent
# nodejs
# AppImageLauncher
# Flameshot
# tldr
# speedtest-cli

# Update the system
sudo apt-get update && sudo apt-get upgrade -y

# install build-essentials and git
sudo apt-get install -y git build-essentials 

# install vim, tldr, speedtest-cli, tmux, ranger, ncdu, htop 
sudo apt-get install vim tldr speedtest-cli tmux ranger ncdu htop -y 

# Purge games
sudo apt-get purge gnome-mahjongg gnome-sudoku gnome-mines aisleriot -y

# cd to downloads, for debs
cd Downloads

# Install Brave
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update -y
sudo apt install brave-browser -y

# Install discord
#cd Downloads
#wget -nc "https://discord.com/api/download?platform=linux&format=deb"
#sudo dpkg -i discord-*.deb -y || sudo apt-get install -f -y && sudo dpkg -i discord-*.deb

# Install VS Code
sudo apt-get install gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update -y
sudo apt install code

#  Install Virtualbox
wget -nc "https://download.virtualbox.org/virtualbox/6.1.34/virtualbox-6.1_6.1.34-150636.1~Ubuntu~jammy_amd64.deb"
sudo dpkg -i virtualbox-*.deb || sudo apt install -f -y 

# Install qbittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt-get update -y && sudo apt-get install qbittorrent -y

# Install nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Appimagelauncher
sudo add-apt-repository ppa:appimagelauncher-team/stable -y && sudo apt-get update -y
sudo apt install appimagelauncher

# Flameshot
sudo apt-get install flameshot -y

# Check if snap is installed, if yes, remove snap and install flatpak
#if dpkg --list | grep snapd > /dev/null; then
#	sudo systemctl disable snapd.socket
#	sudo apt-get purge snapd
#	sudo add-apt-repository ppa:flatpak/stable -y
#	sudo apt update
#	sudo apt install flatpak
#fi

# install flatpak
sudo apt install flaptak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Remove all deb files
rm -rf *.deb && cd 

# Install zsh
sudo apt install zsh -y
sudo chsh -s $(which zsh)
exec "$SHELL"
