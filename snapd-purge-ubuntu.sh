#!/bin/bash

# Script for removing snapd from your Ubuntu system

if dpkg --list | grep snapd > /dev/null; then
	sudo systemctl disable snapd.socket
	sudo apt-get remove snapd
fi
