#!/bin/sh

##
# dotfiles/update.sh
#
# Some git tricks to see if current dotfiles repo
# matches up with github.
#
# See:
# https://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git
#
# Will Badart <wbadart@live.com>
# created: FEB 2018

UPSTREAM=${1:-'@{u}'}
LOCAL=`git rev-parse @`
REMOTE=`git rev-parse "$UPSTREAM"`
BASE=`git merge-base @ "$UPSTREAM"`


if [ $LOCAL = $REMOTE ]; then
    exit 0
elif [ $LOCAL = $BASE ]; then
    echo 'Need to pull'
elif [ $REMOTE = $BASE ]; then
    echo 'Need to push'
else
    echo 'Diverged'
fi
