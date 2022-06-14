export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

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
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"

alias edviconf="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias k="kubectl"

export NOTES_PATH="$HOME/notes"
export JOURNALS_PATH="$HOME/journals"


