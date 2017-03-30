#!/bin/bash

# Essential packages
sudo pacman -S vlc qt4 htop tmux vim dialog wpa_supplicant iw i3 dmenu feh firefox git cmake pulseaudio pulseaudio-alsa alsa-utils openconnect openssh screenfetch zsh redshift ranger ntfs-3g unrar linux-headers linux --needed

# Yaourt

mkdir ~/Temp
cd ~/Temp
git clone https://aur.archlinux.org/package-query.git
cd ~/Temp/package-query
makepkg -si
cd ~/Temp
git clone https://aur.archlinux.org/yaourt.git
cd ~/Temp/yaourt
makepkg -si

# Install dropbox
yaourt -S dropbox turses



# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
