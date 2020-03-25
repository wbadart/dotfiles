##
# zsh/zshresources/common.zsh
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
