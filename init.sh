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
        lsb-release
    usermod -aG sudo ryan   # add ryan to sudo group
}

sshconf() {
    mkdir ~/.ssh && ssh-keyscan -H github.com >> ~/.ssh/known_hosts
    ssh-keygen -t rsa -b 4096 -C "ryan.smith.p@gmail.com" -f $HOME/.ssh/key_name.pem
}

init
sshconf
