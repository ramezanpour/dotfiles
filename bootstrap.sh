#!/bin/bash

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Download 24-bit test script to the home folder
curl --output-dir ~/ -O https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh

# Some nvim plugins require yarn to be installed
npm install -g yarn


# Install vim Plugged
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.config/nvim
cp -n ./nvim/* ~/.config/nvim/

mkdir -p ~/.config/bat
cp -n ./bat/config ~/.config/bat/config

mkdir -p ~/.config/tmux/
cp -n ./tmux/tmux.conf ~/.config/tmux/tmux.conf

mkdir -p ~/.oh-my-zsh/themes
cp -n ./oh-my-zsh/themes/agnoster-moh.zsh-theme ~/.oh-my-zsh/themes/agnoster-moh.zsh-theme

# Zsh completion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
