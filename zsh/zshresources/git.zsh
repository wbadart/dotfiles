#!/usr/bin/env zsh

##
# zsh/zshresources/git.zsh
#
# Git-related helper functions for zsh.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

git_has_changes() {
    command git status --porcelain 2> /dev/null | read -n 1
    return $?
}


_git_status() {
    git_has_changes && echo '*' || echo ''
}


_git_color() {
    if ! git_has_changes; then
        echo $1
    else
        echo "%{$fg[cyan]%}$1%{$reset_color%}"
    fi
}
