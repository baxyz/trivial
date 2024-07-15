#!/bin/bash

# Restore files
cp ~/.trivial/backup/home/* ~

# Snaps OS
sudo snap install htop
sudo snap install jq --edge
sudo snap install rclone

# Snaps GUI
sudo snap install firefox

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

# Flatpak
flatpak install com.github.tchx84.Flatseal
flatpak install it.mijorus.gearlever

# Missing repo
sudo add-apt-repository ppa:git-core/ppa # newest git for WSL

# Update system
sudo apt update
sudo apt upgrade

# Missing packages
sudo apt install \
    # OS
    zsh gnupg2 git bat sshfs \
    # Basics
    p7zip-full \
    # Security
    paperkey \
    # OS GUI
    gnome-control-center gnome-tweaks gnome-browser-connector \
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

# Bun
curl -fsSL https://bun.sh/install | bash

# Theme
echo "Install theme: https://www.gnome-look.org/p/1574551/ or https://www.gnome-look.org/p/1544466"

# Change bash to zsh
sudo -s
chsh -s /bin/zsh root
chsh -s /bin/zsh berenger

# Restore gpg
7z x ~/.trivial/backup/gpg2.7z -o~/.trivial/backup/
gpg2 --import ~/.trivial/backup/public.gpg
gpg2 --import ~/.trivial/backup/private.gpg

# Restore rclone
7z x ~/.trivial/backup/rclone.7z -o~/.trivial/backup/
mkdir -p ~/snap/rclone/current/.config/rclone/
cp ~/.trivial/backup/rclone.conf ~/snap/rclone/current/.config/rclone/rclone.conf

# Manual installation
open https://extensions.gnome.org/extension/1319/gsconnect/
open https://github.com/AppImage/AppImageKit/wiki/FUSE
open https://flatpak.org/setup/Ubuntu
