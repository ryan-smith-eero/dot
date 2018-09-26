#!/bin/bash

# netinstall (with nonfree firmware)
# https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/9.5.0+nonfree/amd64/iso-cd/firmware-9.5.0-amd64-netinst.iso

# init as root
su root
apt-get update
apt-get install \
    apt-transport-https \
    git \
    curl \
    sudo

# add ryan to sudo group
usermod -aG sudo ryan

# leave root
exit

# configure git
git config --global user.name "RPSeq"
git config --global user.email "ryan.smith.p@gmail.com"

# add non-free sources
echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" | sudo tee /etc/apt/sources.list.d/non-free.list

# add sublime gpg key and source
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# update sources and install
sudo apt update
sudo apt install \
    vim-gnome \
    sublime-text \
    firmware-iwlwifi \
    libpam-fprintd \
    fprint-demo \
    editorconfig \
    htop

# turn on wifi (without restart)
modprobe -r iwlwifi ; modprobe iwlwifi

# keybase
sudo curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase
