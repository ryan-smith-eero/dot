#!/bin/bash

# init needs root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

init() {
    apt-get -y update
    apt-get -y install \
        apt-transport-https \
        git \
        sudo \
        lsb-release \
        firmware-iwlwifi
    modprobe -r iwlwifi && modprobe iwlwifi
}

sudoers() {
    echo "ryan ALL=(ALL:ALL) ALL" > /etc/sudoers.d/ryan
}

sshconf() {
    mkdir ~/.ssh && ssh-keyscan -H github.com >> ~/.ssh/known_hosts
    ssh-keygen -t rsa -b 4096 -C "ryan.smith.p@gmail.com" -f $HOME/.ssh/key_name.pem
}

init
sudoers
sshconf
