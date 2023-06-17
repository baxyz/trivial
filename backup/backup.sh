#!/bin/bash

# Daily backup script

# Create some needed variable
day=$(date +%F)
Folder="/home/berenger/"

File="/mnt/c/Users/Bérenger/OneDrive/Stockage/Backup/Sauvegare WSL perso $day.tar.gz2"

# Backup Server Configuration
tar jcvf "$File" \
    .gnupg \
    .oh-my-zsh \
    .ssh \
    scripts \
    .bashrc \
    .gitconfig \
    .npmrc \
    .p10k.zsh \
    .profile \
    .zprofile \
    .zshrc \
    backup.sh \
    reinstall.sh