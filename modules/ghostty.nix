{ config, lib, pkgs, ... }:
{
  options.dotfiles.ghostty.enable = lib.mkEnableOption "Ghostty";

  config = lib.mkIf config.dotfiles.ghostty.enable {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      settings = {
        theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";
        mouse-hide-while-typing = true;
        keybind = [
          "cmd+h=goto_split:left"
          "cmd+j=goto_split:down"
          "cmd+k=goto_split:up"
          "cmd+l=goto_split:right"

          "cmd+shift+h=new_split:left"
          "cmd+shift+j=new_split:down"
          "cmd+shift+k=new_split:up"
          "cmd+shift+l=new_split:right"
        ];
      };
    };
  };
}
