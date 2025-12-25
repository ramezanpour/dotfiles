#!/bin/bash

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Some nvim plugins require yarn to be installed
npm install -g yarn

mkdir -p ~/.config/nvim
cp -n ./nvim/init.lua ~/.config/nvim/

mkdir -p ~/.config/tmux/
cp -n ./tmux/tmux.conf ~/.config/tmux/tmux.conf
