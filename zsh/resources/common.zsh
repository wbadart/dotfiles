##
# zsh/resources/common.zsh
#
# Environment variables shared across all hosts.
#
# Will Badart <will (at) willbadart (dot) com>
# created: MAR 2020
##

source $ZSH_DIR/util.zsh

export NAME='Will Badart'
export EMAIL='will@willbadart.com'
export EDITOR='vim'
export VISUAL="$EDITOR"
export PAGER='less'

export PATH="$(join ':' <<EOF
$HOME/.local/bin
$PATH
/usr/local/bin
EOF
)"

alias grep='grep --color'
alias cls='clear'
alias x='exit'
alias sprunge='curl -F "sprunge=<-" http://spunge.us'
alias yld='curl --data-binary @- https://yld.me/paste <'

alias ts='tmux new-session -s'
alias ta='tmux attach -t'
alias tl='tmux ls'

alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -av'
alias gcb='git checkout -b'
alias gcl='git clone --recursive'
alias gco='git checkout'
alias gd='git diff -v'
alias gfp='git fetch --prune'
alias gl='git pull'
alias gp='git push'
alias gr='git remote'
alias grv='git remote -v'
alias gst='git status'
