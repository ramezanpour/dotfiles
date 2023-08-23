#!/bin/bash

# Copy tmux config
cp ./tmux.conf ~/.tmux.conf
# Install tmux theme
mkdir -p ~/.tmux/themes
git clone https://github.com/arcticicestudio/nord-tmux ~/.tmux/themes/

# This is a requirement for OMZ colorize plugin
pip3 install Pygments


# Download the Nord theme for iterm to the Downloads folder so that it can be applied
curl -O https://github.com/nordtheme/iterm2/blob/develop/src/xml/Nord.itermcolors

# Download 24-bit test script to the home folder
curl -O https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh


# Some nvim plugins require yarn to be installed
npm install -g yarn


