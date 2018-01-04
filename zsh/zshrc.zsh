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

autoload -U colors && colors

export PS1="
%{$fg[red]%}%n%{$reset_color%}@%m[%{$fg[green]%}%~%{$reset_color%}]
%(?..[%?] )%# %{$fg[white]%}"
preexec () { echo -ne "\e[0m" }
postexec () { echo -ne "\e[0m" }
export EMAIL="wbadart@live.com"
