#!/bin/bash

# Restore config
cp ~/.trivial/backup/home/* ~

# Snaps OS
sudo snap install htop
sudo snap install jq
sudo snap install rclone
sudo snap install curl

# Snaps Internet
sudo snap install firefox
#sudo snap install epiphany // using apt since web app is not working

# Put high priority on Firefox
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/firefox 300

# Snaps dev
sudo snap install glab
sudo snap install gh
sudo snap install kubectl --classic
sudo snap install node --classic
sudo snap install deno
sudo snap install bun-js
sudo snap install go --classic
sudo snap install openjdk
sudo snap install diff-so-fancy
sudo snap install json-tui

# Snaps games
sudo snap install geforcenow

# Snaps communication
sudo snap install discord
sudo snap install slack
sudo snap install signal-desktop
sudo snap install zoom-client

# Snaps media
sudo snap install spotify
sudo snap install vlc
sudo snap install mpv

# Snaps desktop
sudo snap install todoist
sudo snap install gnome-weather
sudo snap install gnome-system-monitor
sudo snap install noson
sudo snap install metadata-cleaner
sudo snap install standard-notes && snap connect standard-notes:password-manager-service

# Flatpak - prerequisites
open https://flatpak.org/setup/Ubuntu

# Flatpak
flatpak install com.github.tchx84.Flatseal -y
flatpak install it.mijorus.gearlever -y
flatpak install re.sonny.Commit -y

# Missing repo
sudo add-apt-repository ppa:git-core/ppa # newest git for WSL

# Update system
sudo apt update
sudo apt upgrade

# Missing packages
sudo apt install \
    # OS
    ubuntu-restricted-extras build-essential \
    zsh gnupg2 git bat sshfs exfatprogs pipx \
    # Basics
    p7zip-full \
    # Web
    epiphany-browser \
    # Security
    paperkey \
    # Gaming
    meson libsystemd-dev pkg-config ninja-build libdbus-1-dev libinih-dev gamemode \
    # OS GUI
    gnome-control-center gnome-tweaks gnome-browser-connector \
    # Fonts
    fonts-cmu

# Zsh extra
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/ntnyq/omz-plugin-pnpm.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/pnpm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Node
npm install -g npm \
    npm-merge-driver @pnpm/merge-driver \
    @angular/cli
corepack enable pnpm
corepack enable yarn

# Python
pipx install soco-cli # sonos

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
open https://extensions.gnome.org/extension/7236/firefox-profiles/
open https://extensions.gnome.org/extension/1852/gamemode/
open https://github.com/AppImage/AppImageKit/wiki/FUSE
open https://help.ubuntu.com/community/RestrictedFormats/PlayingDVDs
