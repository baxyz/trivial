#!/bin/bash

# Snaps
sudo snap install node --channel=20/stable --classic
sudo snap install firefox
sudo snap install go --classic
sudo snap install deno
sudo snap install openjdk

# Missing repo
sudo add-apt-repository ppa:git-core/ppa # newest git for WSL
sudo add-apt-repository ppa:wslutilities/wslu # WSLu

# Update systel
sudo apt update
sudo apt upgrade

# Missing packages
sudo apt install \
    # newest git for WSL
    git \
    # Desktop
    gnome-control-center gnome-tweaks \
    # WSLu
    wslu \
    # ZSH
    zsh

# Change bash to zsh
sudo -s
chsh -s /bin/zsh root
chsh -s /bin/zsh berenger

# Node
npm install -g yarn pnpm

# Theme
echo "Install theme: https://www.gnome-look.org/p/1574551/ or https://www.gnome-look.org/p/1544466"
