#!/bin/bash

# NVIM 
NVIM_CONFIG_PATH=$HOME/.config/nvim/
mkdir -p $NVIM_CONFIG_PATH
cp ./neovim/* $NVIM_CONFIG_PATH

# NEWSBOAT
NEWSBOAT_CONFIG_PATH=$HOME/.config/newsboat/
mkdir -p $NEWSBOAT_CONFIG_PATH
cp ./newsboat/* $NEWSBOAT_CONFIG_PATH

# TMUX
mkdir -p $HOME/.tmux/
cp ./tmux.conf $HOME/.tmux.conf
cp ./tmux-theme.tmux $HOME/.tmux/

# ZSH
cp ./.zshrc $HOME/.zshrc

