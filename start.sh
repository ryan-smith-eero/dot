#!/bin/bash

# init as root
su root
apt-get update
apt-get install \
    git \
    sudo \
    firmware-iwlwifi \
    libpam-fprintd \
    fprint-demo

# turn on wifi (without restart)
modprobe -r iwlwifi ; modprobe iwlwifi

# add ryan to sudo group
usermod -aG sudo ryan

# leave root
exit

# add non-free sources
echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" | sudo teee /etc/apt/sources.list.d/non-free.list

# add sublime gpg key and source
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# update sources and install
sudo apt update
sudo apt install \ 
    sublime-text \
    vim \
    curl \
    apt-transport-https

# keybase
sudo curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase
