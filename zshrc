export ZSH="$HOME/.oh-my-zsh"

export ZSH_THEME="robbyrussell"

plugins=(
    colored-man-pages
    colorize
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh


alias vim="nvim"
alias k="kubectl"
alias c="clear"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gp="git push"
alias gd="git diff"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export GPG_TTY=$(tty)
export LANG=en-US.UTF-8
export LC_ALL=en_US.UTF-8

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

