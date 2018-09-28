#!/bin/bash

# netinstall (with nonfree firmware)
# https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/9.5.0+nonfree/amd64/iso-cd/firmware-9.5.0-amd64-netinst.iso

set -euxo pipefail

# configure git
ginit() {
    git config --global user.name "RPSeq"
    git config --global user.email "ryan.smith.p@gmail.com"
}

# add sources
sources() {
    echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" | sudo tee /etc/apt/sources.list.d/non-free.list
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
}

# add apt keys
keys() {
    sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo wget -qO - https://download.docker.com/linux/debian/gpg | sudo apt-key add -
}

# update sources and install
install() {
    sudo apt-get -y update
    sudo apt-get -y install \
        vim-gnome \
        sublime-text \
        libpam-fprintd \
        fprint-demo \
        editorconfig \
        curl \
        ca-certificates \
        gnupg2 \
        software-properties-common \
        htop \
        docker-ce \
        python \
        python-pip \
        xclip \
        tmux \
        firmware-iwlwifi
    sudo modprobe -r iwlwifi && sudo modprobe iwlwifi
}

# manual installs
firefox() {
    curl -fsSL -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
    sudo tar -C /opt -xvf firefox.tar.bz2
    sudo rm -rf firefox.tar.bz2
    sudo ln -sf "$(pwd)"/firefox/firefox.desktop /usr/share/applications/firefox.desktop
    sudo apt-get -y remove firefox-esr
}

vundle() {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

config() {
    ln -sf "$(pwd)"/editor/.editorconfig ~/.editorconfig
    ln -sf "$(pwd)"/vim/.vimrc ~/.vimrc
    ln -sf "$(pwd)"/bash/.bashrc ~/.bashrc
    ln -sf "$(pwd)"/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
}

keybase() {
    curl -fsSL -o keybase_amd64.deb "https://prerelease.keybase.io/keybase_amd64.deb"
    sudo dpkg --force-all -i keybase_amd64.deb
    sudo apt-get install -yf
    rm -rf keybase_amd64.deb
    run_keybase
}

rem() {
    sudo apt-get autoremove -y
}

ginit
sources
keys
install
firefox
vundle
config
keybase
rem
