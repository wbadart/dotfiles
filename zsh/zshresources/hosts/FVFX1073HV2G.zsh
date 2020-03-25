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
alias vim='nvim'
alias k='kubectl'
alias wk='watch kubectl'
alias antibody-refresh="antibody bundle < $ZSH_DIR/plugins.txt > $HOME/.cache/antibody/plugins.sh"

export AGKOZAK_BLANK_LINES=1
source $HOME/.cache/antibody/plugins.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(stack --bash-completion-script stack)"

eval "$(pyenv init -)"
