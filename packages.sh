#!/bin/bash

# Create projects folder

mkdir -p ~/projects

# Updating repos
sudo pacman -Suy

# Essential packages
sudo pacman -S xorg xorg-xinit geary htop tmux vim dialog wpa_supplicant iw git cmake openconnect openssh screenfetch zsh redshift ranger ntfs-3g unzip unrar linux-headers linux powerline lm_sensors libreoffice-still goldendict transmission-gtk links sdcv youtube-dl aria2 units clang ttf-dejavu ttf-liberation noto-fonts python python-pip --needed

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

# Install yaourt packages
yaourt -S dropbox google-chrome postman-bin slack-desktop

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# VIM configuration

# Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# VIMRC
cp ~/projects/dotfiles/.vimrc ~/.vimrc

vim +PluginInstall

# Build YCM

~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-clang

cp ~/projects/dotfiles/.zshrc ~/.zshrc
cp ~/projects/dotfiles/tmux.conf ~/.tmux.conf
