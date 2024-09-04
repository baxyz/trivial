#!/bin/bash
# Vérifier et créer le dossier de montage si nécessaire
if [ ! -d "$HOME/Cloud/Proton Drive" ]; then
    mkdir -p "$HOME/Cloud/Proton Drive"
fi
# Monter Proton Drive
rclone mount "Proton Drive": "$HOME/Cloud/Proton Drive" --daemon

