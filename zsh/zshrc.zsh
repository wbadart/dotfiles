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
source "$ZSH_DIR/completion.zsh"

autoload -U colors && colors
setopt PROMPT_SUBST
export PROMPT='
%{$fg[red]%}%n%{$reset_color%}$(_git_color @)%m[%{$fg[green]%}%~%{$reset_color%}]
%(?..[%?] )%# %{$fg[white]%}'

export EMAIL="wbadart@live.com"
export PATH="$PATH:/home/user/.gem/ruby/2.5.0/bin"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

bindkey ' ' magic-space
