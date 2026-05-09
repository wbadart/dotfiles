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
      };
    };
  };
}
