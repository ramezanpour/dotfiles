#!/bin/bash

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Some nvim plugins require yarn to be installed
npm install -g yarn


# Install vim Plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
cp -n ./nvim/* ~/.config/nvim/

mkdir -p ~/.config/bat
cp -n ./bat/config ~/.config/bat/config

mkdir -p ~/.config/tmux/
cp -n ./tmux/tmux.conf ~/.config/tmux/tmux.conf

mkdir -p ~/.oh-my-zsh/themes
cp -n ./oh-my-zsh/themes/agnoster-moh.zsh-theme ~/.oh-my-zsh/themes/agnoster-moh.zsh-theme
