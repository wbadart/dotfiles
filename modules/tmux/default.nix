{ lib, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    extraConfig = builtins.readFile ./tmux.conf;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    shell = lib.getExe pkgs.zsh;
    shortcut = "a";
    terminal = "screen-256color";
  };

  home.shellAliases = {
    t = "tmux";
    ta = "tmux attach";
    tn = ''tmux new -s "$(basename "$PWD")"'';
  };
}
