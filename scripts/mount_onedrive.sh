#!/bin/bash
# Vérifier et créer le dossier de montage si nécessaire
if [ ! -d "$HOME/Cloud/OneDrive" ]; then
    mkdir -p "$HOME/Cloud/OneDrive"
fi
# Monter OneDrive
rclone mount OneDrive: "$HOME/Cloud/OneDrive" --daemon
