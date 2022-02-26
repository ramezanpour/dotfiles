export ZSH="/Users/temporaryadmin/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    docker
    docker-compose
    kubectl
    colored-man-pages
    git-flow
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"

alias edviconf="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias k="kubectl"

