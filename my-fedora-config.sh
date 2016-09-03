#!/bin/bash
set -e
echo "Starting my Fedora script...\n Before getting started please copy your SSH private keys to ~/.SSH. We need this to be able to download some private repositories."

ESSENTIAL="vim git @c-development gcc-c++ python3 python-devel python3-devel stunnel python3-pip http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm kernel kernel-devel zsh aria2 powerline filezilla goldendict htop hexchat cmake calibre util-linux-user chromium"

echo "Installing essential packages..."
su -c "dnf install -y $ESSENTIAL"

echo "Clonning my dot files."
git clone https://github.com/ramezanpour/dotfiles.git $HOME/.dotfiles --depth=1
echo "Configuring system."
cp ~/.dotfiles/.vimrc ~/.vimrc
cp ~/.dotfiles/.gitconfig ~/.gitconfig
echo "Installing Oh my ZSH. You may need to re-enter your credentials."
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
echo "Installing base 16 shell theme"
git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
echo "Configuring SHELL"
rm $HOME/.zshrc
touch $HOME/.zshrc
echo "export ZSH=$HOME/.oh-my-zsh" >> $HOME/.zshrc
echo "BASE16_SHELL=$HOME/.config/base16-shell/" >> $HOME/.zshrc
echo "[ -n \"$PS1\"   ] && [ -s $BASE16_SHELL/profile_helper.sh   ] && eval \"$($BASE16_SHELL/profile_helper.sh)\"" >> $HOME/.zshrc
echo "plugins=(git)" >> $HOME/.zshrc
echo "source $ZSH/oh-my-zsh.sh" >> $HOME/.zshrc

