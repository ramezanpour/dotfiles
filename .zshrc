export ZSH="/Users/mohammad/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    docker
    docker-compose
    colored-man-pages
    git-flow
    zsh-completions
    universalarchive
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"
alias vpn="sudo openconnect 162.223.88.26:8443 --servercert pin-sha256:9OzJcVfnM6cANjNj0k2ulhqRS3UrcEs94C4yS6d7nOg="

alias godev="cd ~/go/src"
alias edviconf="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias weather="curl -s 'http://wttr.in/tehran?m'"
alias u-dot="updateDotFiles.sh"
alias scripts="cd ~/dev/scripts"


#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/bin/:$PATH"
export PATH="$HOME/dev/scripts/:$PATH"

# bindkey -v
