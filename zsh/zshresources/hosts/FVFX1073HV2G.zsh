source $ZSH_DIR/util.zsh

export JAVA_HOME="$HOME/.local/jdk-12.jdk/Contents/Home"
export AGDA_DIR="$HOME/.agda"

export PATH="$(join ':' <<EOF
/usr/local/opt/coreutils/libexec/gnubin
/usr/local/opt/gnu-sed/libexec/gnubin
$PATH
$HOME/.local/bin/platform-tools
$HOME/miniconda3/bin
/usr/local/texlive/2018/bin/x86_64-darwin
$JAVA_HOME/bin
EOF
)"

export LEDGER_FILE="$HOME/.config/ledger/MAR2020.journal"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/Library/Frameworks/GStreamer.framework/Versions/1.0/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export LDFLAGS="-L/usr/local/opt/openblas/lib -L/usr/local/opt/sqlite/lib -L /Library/Frameworks/GStreamer.framework/Libraries"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export CPPFLAGS="-I/usr/local/opt/openblas/include -I/usr/local/opt/sqlite/include -I/Library/Frameworks/GStreamer.framework/Headers"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
