#!/bin/bash

##
# init.sh
#
# Links dotfiles to their proper locations
# in the user's home directory.
#
# Will Badart
# created: FEB 2017
#
# Check out these links for more:
# - https://github.com/pricco/gnome-terminal-colors-monokai.git
#
# Don't forget to install:
# - git
# - python
# - vim
##

#=========
# Helpers
#=========

usage(){
    echo "usage: $0 CMD [ -h ]" >&2
    echo "    CMD    (link|git|ssh|powerline|all) Run the specified configuration commands" >&2
    echo "   -h      Display this help message" >&2
    if [ -z "$1" ]; then
        exit 0;
    else
        exit $1;
    fi
}

testormake(){
    test -d $1 || mkdir -p $1
}


#===================
# Link config files
#===================

linkrcs(){
    echo "Linking rc files...";
    ln -s $PWD/.vim       $HOME/.vim
    ln -s $PWD/.vimrc     $HOME/.vimrc
    ln -s $PWD/.zshrc     $HOME/.zshrc
    ln -s $PWD/.tmux.conf $HOME/.tmux.conf
    source $HOME/.zshrc
    echo "Done."
}

#============
# Git config
#============

gitconfig(){
    echo "Configuring git..."
    git config --global user.name    "$NAME"
    git config --global user.email   "$EMAIL"
    git config --global core.editor  "$EDITOR"
    git config --global push.default "simple"
    echo "Done."
}


#============
# SSH Config
#============

sshconfig(){
    echo "Creating ssh identity..."
    testormake $HOME/.ssh
    ln -s $PWD/ssh.conf $HOME/.ssh/config

    # Create identity
    #   https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
    if [ ! -f $HOME/.ssh/id_rsa ]; then
        ssh-keygen -t rsa -b 4096 -C "$EMAIL"
        eval "$(ssh-agent -s)"
        ssh-add $HOME/.ssh/id_rsa
    fi
    echo "Done."
}


#========================
# Powerline installation
#========================

powerlineconfig(){
    echo "Installing powerline..."
    which pip || curl https://bootstrap.pypa.io/get-pip.py | python -
    pip install --user powerline-status

    mkdir wd && cd wd

    # Fonts
    git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh && cd -
    curl -O https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    curl -O https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

    testormake $HOME/.fonts
    mv PowerlineSymbols.otf $HOME/.fonts
    fc-cache -vf $HOME/.fonts

    testormake $HOME/.config/fontconfig/conf.d
    cp 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d

    cd .. && rm -rf wd
    echo "Done."
}


#=====
# CLI
#=====

while getopts ":h" opt; do
    case $opt in
        h)  usage
            ;;
        \?) echo "Invalid option: -$OPTARG" >&2
            usage 1
            ;;
    esac
done

case $1 in
    link)      linkrcs ;;
    git)       gitconfig ;;
    ssh)       sshconfig ;;
    powerline) powerlineconfig ;;
    all)
        echo "Executing all configuration..."
        linkrcs
        gitconfig
        sshconfig
        powerlineconfig
        ;;
    *) echo "Invalid command: $1" >&2
        usage 1 ;;
esac

