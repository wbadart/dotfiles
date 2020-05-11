set fish_color_cwd brblue
set fish_color_host brblack
set fish_prompt_pwd_dir_length 0
set fish_greeting

set AGDA_DIR $HOME/.config/agda
set GNUPGHOME $HOME/.config/gnupg
set PYENV_ROOT $HOME/.pyenv
set STACK_ROOT $HOME/.config/stack
set -U LESSHISTFILE '-'

set -U fish_user_paths $HOME/.local/bin $HOME/.nix-profile/bin $PYENV_ROOT/bin '/usr/local/opt/ruby/bin'

pyenv init - | source
fenv source $HOME/.nix-profile/etc/profile.d/nix.sh
eval (direnv hook fish)

alias t "tmux -f $HOME/.config/tmux/main.conf"

alias g "git"
alias ga "git add"
alias gc "git commit -v"
alias gca "git commit -av"
alias gd "git diff"
alias gl "git pull"
alias gp "git push"
alias gr "git remote"
alias gst "git status"
alias gco "git checkout"
