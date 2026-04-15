#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function red {
    printf "${RED}$@${NC}\n"
}

function green {
    printf "${GREEN}$@${NC}\n"
}

function yellow {
    printf "${YELLOW}$@${NC}\n"
}

# Check for root privileges
if [ $EUID -ne 0 ]; then
    red 'Installer must be run as root!'
    red "Try running: sudo $0"
    exit 1
fi

# 1. Copiar el script principal
install -D ./gopro /usr/local/sbin/gopro

# 2. Instalar regla de udev para detección inmediata
cp 60-gopro.rules /etc/udev/rules.d/
udevadm control --reload-rules
udevadm trigger

# 3. Instalar servicio de sistema
cp gopro_webcam.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable gopro_webcam.service

yellow "**********************"
printf "\n\n"
green "The GoPro HERO13 auto-start installation succeeded!"
green "The camera will now be recognized IMMEDIATELY when plugged in."
green "Resolution: 1080p | FOV: Linear"
printf "\n\n"
yellow "**********************"
