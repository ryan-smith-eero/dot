#!/bin/bash

#------------------------------------------------------------------------------
# File:   $HOME/start.sh
# Author: Ryan Smith  <ryan.smith.p@eero.com>
#------------------------------------------------------------------------------

set -euxo pipefail

DIR=$(dirname "$(readlink -f "$0")")

# update sources and install
install() {
    sudo apt-get -y update
    sudo apt-get -y install \
        editorconfig \
        htop \
        python \
        python-pip \
        xclip \
        tmux \
        gnome-shell-extensions \
        gimp \
        libc++abi1 \
        libc++1 \
        jq \
        default-jdk \
        scala
}

vundle() {
    set +e
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    set -e
}

discord() {
    curl -o discord.deb -L 'https://discordapp.com/api/download?platform=linux&format=deb'
    sudo dpkg -i discord.deb
    sudo rm -f discord.deb
}

scala() {
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
    sudo apt-get update
    sudo apt-get install sbt
}

config() {
    ln -sf ${DIR}/editor/.editorconfig ~/.editorconfig
    ln -sf ${DIR}/vim/.vimrc ~/.vimrc
    ln -sf ${DIR}/bash/.bashrc ~/.bashrc
    ln -sf ${DIR}/bash/.git-status.bash ~/.git-status.bash
    ln -sf ${DIR}/gtk/gtk.css ~/.config/gtk-3.0/gtk.css
}

rem() {
    sudo apt-get autoremove -y
}

#install
#vundle
#discord
scala
#config
#rem
