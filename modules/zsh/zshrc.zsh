##
# dotfiles/zsh/zshrc.zsh
#
# Main zsh configuration.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

export ZSH_DIR="$HOME/.config/zsh"
source "$ZSH_DIR/util.zsh"

# Zsh settings
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000
export SAVEHIST=10000
setopt autocd nomatch notify sharehistory
unsetopt beep extendedglob
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v

# User settings
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

# Source the submodules
for f in $(ls $ZSH_DIR/*.zsh); do
    source "$f"
done
for f in $(ls $ZSH_DIR/hosts/*.zsh); do
    f="$(basename "$f" .zsh)"
    if [ "$f" = "$(hostname)" -o "$f" = "$(uname)" ]; then
        source "$ZSH_DIR/hosts/$f.zsh"
    fi
done
