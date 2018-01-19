##
# .zshrc
#
# Main zsh configuration.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

setopt PROMPT_SUBST
ZSH_DIR="$HOME/.zsh"

# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

for f in `ls $ZSH_DIR`; do
    source "$ZSH_DIR/$f"
done

autoload -U colors && colors

export PROMPT='
%{$fg[red]%}%n%{$reset_color%}$(_git_color @)%m[%{$fg[green]%}%~%{$reset_color%}]
%(?..[%?] )%# %{$fg[white]%}'
preexec () { echo -ne "\e[0m" }
postexec () { echo -ne "\e[0m" }

export EMAIL="wbadart@live.com"
export PATH="$PATH:/home/user/.gem/ruby/2.5.0/bin"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

bindkey ' ' magic-space
