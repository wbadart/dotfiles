##
# dotfiles/zsh/zshrc.zsh
#
# Main zsh configuration.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

export ZSH_DIR="$HOME/.config/zsh"

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Source the submodules

for f in `\ls $ZSH_DIR/*.zsh`; do
    source "$f"
done
for f in `\ls $ZSH_DIR/hosts/*.zsh`; do
    f=`basename "$f" .zsh`
    if [ "$f" = "`hostname`" -o "$f" = "`uname`" ]; then
        source "$ZSH_DIR/hosts/$f.zsh"
    fi
done

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
