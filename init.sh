#!/bin/bash

#------------------------------------------------------------------------------
# File:   $HOME/init.sh
# Author: Ryan Smith  <ryan.smith.p@gmail.com>
#------------------------------------------------------------------------------

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
}

sudoers() {
    echo "ryan ALL=(ALL:ALL) ALL" > /etc/sudoers.d/ryan
}

sshconf() {
    sudo -u ryan -i mkdir /home/ryan/.ssh && ssh-keyscan -H github.com >> /home/ryan/.ssh/known_hosts
    sudo -u ryan -i ssh-keygen -t rsa -b 4096 -C "ryan.smith.p@gmail.com" -f /home/ryan/.ssh/key_name.pem
}

loader() {
    sudo -u ryan -i git clone https://github.com/RPSeq/dot.git /home/ryan/dot
}

init
sudoers
sshconf
loader
