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


# Prompt config

source "$ZSH_DIR/completion.zsh"
autoload -U colors && colors
setopt PROMPT_SUBST
export PROMPT='
%{$fg[red]%}%n%{$reset_color%}@%m[$(_git_prompt)%{$fg[green]%}%~%{$reset_color%}]
%(?..[%?] )%# '


bindkey ' ' magic-space
# source /usr/share/nvm/init-nvm.sh
# . $POWERLINE_RTP/bindings/zsh/powerline.zsh
