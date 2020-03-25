##
# zsh/zshresources/env.common.zsh
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
