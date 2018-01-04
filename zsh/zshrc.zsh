##
# .zshrc
#
# Main zsh configuration.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

ZSH_DIR="$HOME/.zsh"

for f in `ls $ZSH_DIR`; do
    source "$ZSH_DIR/$f"
done

export PS1="
%n@%m[%~]
%(?..[%?] )%# "
export RPROMPT="%T"
export EMAIL="wbadart@live.com"
