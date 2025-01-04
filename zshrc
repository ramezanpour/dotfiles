export ZSH="$HOME/.oh-my-zsh"

export ZSH_THEME="robbyrussell"

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

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export GPG_TTY=$(tty)
export LANG=en-US.UTF-8
export LC_ALL=en_US.UTF-8
source ~/.config/nvim/plugged/gruvbox/gruvbox_256palette_osx.sh
