#!/usr/bin/env zsh

##
# zsh/zshresources/git.zsh
#
# Git-related helper functions for zsh.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##


_git_prompt() {
    if ! _in_git; then
        echo ''
    else
        branch=`_git_branch`
        echo "`_git_color $branch`:"
    fi
}


_in_git() {
    command git status --porcelain > /dev/null 2> /dev/null
    return $?
}


_git_has_changes() {
    command git status --porcelain 2> /dev/null | read -n 1
    return $?
}


_git_status() {
    _git_has_changes && echo '*' || echo ''
}


_git_color() {
    if ! _git_has_changes; then
        echo $1
    else
        echo "%{$fg[cyan]%}$1%{$reset_color%}"
    fi
}


_git_branch() {
    echo `git branch | grep "\*" | cut -b 3-`
}
