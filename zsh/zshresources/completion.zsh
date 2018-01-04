zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
bindkey '^R' history-incremental-search-backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
