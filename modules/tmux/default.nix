{ lib, pkgs, ... }:
{
  programs.tmux = {
    clock24 = true;
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    shell = lib.getExe pkgs.zsh;
    shortcut = "a";
    terminal = "screen-256color";
  };
}
