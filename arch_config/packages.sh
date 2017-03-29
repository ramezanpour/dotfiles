#!/bin/bash
set e

# Essential packages
sudo pacman -Sy vlc qt4 htop tmux vim dialog wpa_supplicant iw i3 dmenu feh firefox git cmake pulseaudio pulseaudio-alsa alsa-utils openconnecti openssh screenfetch zsh --needed

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
