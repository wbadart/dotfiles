##
# dotfiles/zsh/zshrc.zsh
#
# Main zsh configuration.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

export ZSH_DIR="$HOME/.zsh"


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

export EMAIL='wbadart@live.com'
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin:/home/user/.nvm/versions/node/v9.5.0/bin:/home/user/.config/yarn/global/node_modules/.bin"
export EDITOR='vim'
export VISUAL="$EDITOR"

bindkey ' ' magic-space
# source /usr/share/nvm/init-nvm.sh
