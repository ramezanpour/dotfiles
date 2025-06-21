#!/bin/bash

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Some nvim plugins require yarn to be installed
npm install -g yarn
npm install -g prettier
npm install -g pyright
npm install -g eslint

# Install Paq for neovim
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

mkdir -p ~/.config/nvim
cp -n ./nvim/init.lua ~/.config/nvim/

mkdir -p ~/.config/bat
cp -n ./bat/config ~/.config/bat/config

mkdir -p ~/.config/tmux/
cp -n ./tmux/tmux.conf ~/.config/tmux/tmux.conf
