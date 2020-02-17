export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

export ZSH="/Users/mohammad/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    osx
    docker
    docker-compose
    colored-man-pages
    git-flow
    virtualenv
)

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"
alias vpn="sudo openconnect 162.223.88.26:8443 --servercert pin-sha256:9OzJcVfnM6cANjNj0k2ulhqRS3UrcEs94C4yS6d7nOg="

