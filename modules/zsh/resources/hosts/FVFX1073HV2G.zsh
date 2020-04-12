source $ZSH_DIR/util.zsh
source $HOME/.nix-profile/etc/profile.d/nix.sh

export AGDA_DIR="$HOME/.agda"
export JAVA_HOME="$HOME/.local/jdk-12.jdk/Contents/Home"
export KASTEN="$HOME/Documents/Kasten"
export LEDGER_FILE="$HOME/.config/ledger/MAR2020.journal"
export NVM_DIR="$HOME/.config/nvm"
export NVM_LAZY_LOAD='true'
export POETRY_HOME="$HOME/.config/poetry"

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

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/Library/Frameworks/GStreamer.framework/Versions/1.0/lib/pkgconfig"

alias vim='nvim'
alias k='kubectl'
alias wk='watch kubectl'
alias antibody-refresh="antibody bundle < $ZSH_DIR/plugins.txt > $HOME/.cache/antibody/plugins.sh"

export AGKOZAK_BLANK_LINES=1
source $HOME/.cache/antibody/plugins.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
