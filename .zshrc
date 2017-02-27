# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/ubuntu/.oh-my-zsh
export EDITOR="vim"
export TERM="xterm-256color"
export NAME="Will Badart"
export EMAIL="wbadart@nd.edu"

plugins=(git tmux)
ZSH_THEME="avit"

source $ZSH/oh-my-zsh.sh

alias zconf="$EDITOR ~/.zshrc; source ~/.zshrc"
alias vconf="$EDITOR ~/.vimrc"
alias x="exit"
alias cls="clear"

