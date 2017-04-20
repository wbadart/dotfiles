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
# - https://raw.githubusercontent.com/KittyKatt/screenFetch/master/screenfetch-dev
#
# Don't forget to install: git, python, vim, zsh
##

#=========
# Helpers
#=========

usage(){
    echo "usage: $0 CMD [ -h ]" >&2
    echo "    CMD    (link|git|ssh|nvm|powerline|all) Run the specified configuration commands" >&2
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
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ln -s $PWD/.vim       $HOME/.vim
    ln -s $PWD/.vimrc     $HOME/.vimrc
    ln -s $PWD/.zshrc     $HOME/.zshrc
    ln -s $PWD/.tmux.conf $HOME/.tmux.conf
    ln -s $PWD/.gitconfig $HOME/.gitconfig

    testormake $HOME/.config/i3
    # ln -s $PWD/config_i3_config $HOME/.config/i3/config
    # ln -s $PWD/etc_i3status.conf /etc/i3status.conf

    echo "Done."
    echo "Please source $HOME/.zshrc"
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

#=============
# Install NVM
#=============

nvm(){
    echo "Installing Node Version manager..."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | zsh
    source $HOME/.zshrc
    nvm install node
    npm i -g yarn pm2
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
    ssh)       sshconfig ;;
    nvm)       nvm;;
    powerline) powerlineconfig ;;
    all)
        echo "Executing all configuration..."
        linkrcs
        sshconfig
        powerlineconfig
        ;;
    *) echo "Invalid command: $1" >&2
        usage 1 ;;
esac

