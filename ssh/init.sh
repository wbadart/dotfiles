#!/bin/sh

##
# ssh/init.sh
#
# Setup ssh config and create keys. See:
# https://help.github.com/articles/
#   generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

SSH_CONFDIR="$HOME/.ssh"


test -d "$SSH_CONFDIR" || mkdir "$SSH_CONFDIR"

if [ ! -f "$SSH_CONFDIR/id_rsa" ]; then
    if [ ! -z "$EMAIL" ]; then
        email="$EMAIL"
    else
        printf 'email: '
        read email
    fi
    ssh-keygen -t rsa -b 4096 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add "$SSH_CONFDIR/id_rsa"
fi
