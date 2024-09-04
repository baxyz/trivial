#!/bin/bash
# Vérifier et créer le dossier de montage si nécessaire
if [ ! -d "$HOME/Cloud/Google Drive" ]; then
    mkdir -p "$HOME/Cloud/Google Drive"
fi
# Monter Google Drive
rclone mount "Google Drive": "$HOME/Cloud/Google Drive" --daemon
