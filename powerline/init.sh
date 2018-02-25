#!/bin/sh

##
# powerline/init.sh
#
# Installs powerline status bar.
#
# Will Badart <wbadart@nd.edu>
# created: FEB 2018
##

if ! which pip > /dev/null; then
    echo 'Requires pip'
    exit 1
fi
pip install --user powerline-status > /dev/null
installdir=`pip show powerline-status | awk '/Location/{ print $2 }'`

if [ -z "$POWERLINE_RTP" ]; then
    echo "export POWERLINE_RTP='$installdir'" >> "$ZSH_DIR/env.local.zsh"
    echo "Please source $ZSH_DIR/env.local.zsh to use \$POWERLINE_RTP"
fi


# Get the powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
