#!/bin/bash

# Brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install

# git configs
git config --global user.name  "Mohammad M. Ramezanpour"
git config --global user.email "i@ramezanpour.net"
git config --global core.editor "nvim"

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Some nvim plugins require yarn to be installed
npm install -g yarn

mkdir -p ~/.config/nvim
cp -r ./nvim/* ~/.config/nvim/

mkdir -p ~/.config/tmux/
cp -n ./tmux/tmux.conf ~/.config/tmux/tmux.conf

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ./zshrc ~/.zshrc







