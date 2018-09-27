#!/bin/bash

# init needs root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

init() {
    apt-get update
    apt-get install \
        apt-transport-https \
        git \
        sudo \
        lsb-release
    usermod -aG sudo ryan   # add ryan to sudo group
}

init
