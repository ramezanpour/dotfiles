export ZSH="/Users/mohammad/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    docker
    docker-compose
    colored-man-pages
    git-flow
    zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"
alias vpn="sudo openconnect 162.223.88.26:8443 --servercert pin-sha256:9OzJcVfnM6cANjNj0k2ulhqRS3UrcEs94C4yS6d7nOg="
alias dotfiles="cd ~/dev/dotfiles"
alias godev="cd ~/go/src"


export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/bin/:$PATH"

# bindkey -v
