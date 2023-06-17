#!/bin/bash

# Missing repo
sudo add-apt-repository ppa:git-core/ppa # newest git for WSL
sudo add-apt-repository ppa:wslutilities/wslu # WSLu

# Update systel
sudo apt update
sudo apt upgrade

# Missing packages
sudo apt install \
    git \ # newest git for WSL
    x11-apps firefox nautilus \ # GUI
    wslu \ # WSLu
    zsh \ # ZSH
    libtinfo5 libegl1 libxcb-icccm4 libxcb-keysyms1 libxcb-render-util0 libxkbcommon-x11-0 libxcb-xinerama0 # For QT and Sailfish dev

# Change bash to zsh
sudo -s
chsh -s /bin/zsh root
chsh -s /bin/zsh berenger

# Theme
echo "Install theme: https://www.gnome-look.org/p/1574551/ or https://www.gnome-look.org/p/1544466"
