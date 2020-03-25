#!/usr/bin/env zsh
# Environment config

export EMAIL='wbadart@live.com'
export EDITOR='vim'
export VISUAL="$EDITOR"
export PAGER='less'

export JAVA_HOME="$HOME/.local/jdk-12.jdk/Contents/Home"
export AGDA_DIR="$HOME/.agda"

export PATH="$(cat <<EOF | tr '\n' ':' | sed 's/:$//'
$HOME/.local/bin
$PATH
/usr/local/sbin
$JAVA_HOME/bin
EOF
)"

# export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

export LEDGER_FILE="$HOME/.config/ledger/MAR2020.journal"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/Library/Frameworks/GStreamer.framework/Versions/1.0/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export LDFLAGS="-L/usr/local/opt/openblas/lib -L/usr/local/opt/sqlite/lib -L /Library/Frameworks/GStreamer.framework/Libraries"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export CPPFLAGS="-I/usr/local/opt/openblas/include -I/usr/local/opt/sqlite/include -I/Library/Frameworks/GStreamer.framework/Headers"
