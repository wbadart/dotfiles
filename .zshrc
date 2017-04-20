# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export PATH="$HOME/.bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export TERM="xterm-256color"
export NAME="Will Badart"
export EMAIL="wbadart@nd.edu"
export LD_LIBRARY_PATH="/usr/local/lib"

plugins=(git tmux)
ZSH_THEME="clean"

source $ZSH/oh-my-zsh.sh

test -d ~/Desktop && rmdir ~/Desktop

alias zconf="$EDITOR ~/.zshrc; source ~/.zshrc"
alias vconf="$EDITOR ~/.vimrc"
alias x="exit"
alias cls="clear"
alias pacaur='yaourt'
alias xclip='xclip -selection clipboard'
alias smb="test -d /mnt/smb || sudo mkdir -p /mnt/smb; sudo mount -t cifs //fs.nd.edu/~wbadart -o uid=1000,domain=adnd,username=wbadart /mnt/smb"
alias ateraan="nc `head -n 1 $HOME/doc/ateraan`"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
