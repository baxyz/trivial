#!/bin/bash

# Snaps bash
sudo snap install htop
sudo snap install jq --edge

# Snaps GUI
sudo snap install firefox
sudo snap install chromium
sudo snap install snap-store

# Snaps dev
sudo snap install glab
sudo snap install gh
sudo snap install kubectl --classic
sudo snap install node --classic
sudo snap install deno
sudo snap install go --classic
sudo snap install openjdk
sudo snap install diff-so-fancy
sudo snap install json-tui

# Snaps games
sudo snap install bastet

# Missing repo
sudo add-apt-repository ppa:git-core/ppa # newest git for WSL
sudo add-apt-repository ppa:wslutilities/wslu # WSLu

# Update systel
sudo apt update
sudo apt upgrade

# Missing packages
sudo apt install \
    # OS
    zsh gnupg2 git bat sshfs \
    # OS WSL
    wslu \
    # Security
    paperkey \
    # OS GUI
    gnome-control-center gnome-tweaks \
    # Fonts
    fonts-cmu
    

# Zsh extra
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/ntnyq/omz-plugin-pnpm.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/pnpm

# Node
npm install -g \
    npm yarn pnpm \
    npm-merge-driver @pnpm/merge-driver \
    @angular/cli

# Theme
echo "Install theme: https://www.gnome-look.org/p/1574551/ or https://www.gnome-look.org/p/1544466"

# Change bash to zsh
sudo -s
chsh -s /bin/zsh root
chsh -s /bin/zsh berenger

# Restore gpg
# ls -hl *.gpg
gpg2 --import ~/trivial/backup/public.gpg
gpg2 --import ~/trivial/backup/private.gpg