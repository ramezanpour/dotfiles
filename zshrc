export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster-moh"

plugins=(
    git
    docker
    docker-compose
    kubectl
    colored-man-pages
    git-flow
    colorize
    direnv
    tmux
    aws
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh


alias edvconf="nvim ~/.config/nvim/init.vim"
alias edtconf="nvim ~/.config/tmux/tmux.conf"
alias edzconf="nvim ~/.zshrc"

alias vim="nvim"
alias k="kubectl"
alias c="clear"

export PATH=$HOME/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"

export GPG_TTY=$(tty)
