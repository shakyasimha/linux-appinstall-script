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
# fonts-noto
# ttf-mscore-fonts
# powerline-fonts

# Update the system
sudo apt-get update && sudo apt-get upgrade -y

# Remove unusued dependencies
sudo apt-get autoremove -y
 
# install build-essentials, git, net-tools
sudo apt-get install -y git build-essentials net-tools -y

# install vim, tldr, speedtest-cli, tmux, ranger, ncdu, htop 
sudo apt-get install vim tldr speedtest-cli tmux ranger ncdu htop -y 

# Purge games (full install)
sudo apt-get purge gnome-mahjongg gnome-sudoku gnome-mines aisleriot -y

# Enable multiverse repo and install ms-fonts
sudo add-apt-repository multiverse
sudo apt update -y
sudo apt install fonts-noto fonts-powerline fonts-cascadia-code ttf-mscorefonts-installer -y

# cd to downloads, for debs
cd Downloads

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
sudo apt install -y appimagelauncher

# install flatpak
sudo apt install flatpak flatpak-xdg-utils gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install nala
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt -y update && sudo apt install -y nala

# install pip
sudo apt-get install python3-pip python-is-python3 -y

# install dconf-editor and gnome-tweaks
sudo apt-get install dconf-editor gnome-tweaks chrome-gnome-shell -y

# install zsh
sudo apt-get install -y zsh zsh-autosuggestions zsh-syntax-highlighting 

# Remove all deb files
rm -rf *.deb && cd 
