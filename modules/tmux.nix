{ lib, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    shell = lib.getExe pkgs.zsh;
    shortcut = "a";
    terminal = "screen-256color";

    extraConfig = ''
      bind-key -r h select-pane -L
      bind-key -r j select-pane -U
      bind-key -r k select-pane -D
      bind-key -r l select-pane -R

      bind-key -rn M-h resize-pane -L 5
      bind-key -rn M-j resize-pane -U 5
      bind-key -rn M-k resize-pane -D 5
      bind-key -rn M-l resize-pane -R 5

      set-option -g status-style 'bg=black fg=white bold'
      set-option -g status-justify absolute-centre
    '';
  };
}
