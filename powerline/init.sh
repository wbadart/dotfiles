#!/bin/sh

##
# powerline/init.sh
#
# Installs powerline status bar.
#
# Will Badart <wbadart@nd.edu>
# created: FEB 2018
##

which pip > /dev/null || echo 'Requires pip' && exit 1
pip install --user powerline-status > /dev/null
echo 'Powerline installed to:' >&2
pip show powerline-status | awk '/Location/{ print $2 }'
