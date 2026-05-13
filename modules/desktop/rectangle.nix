{ config, lib, ... }:
{
  options.dotfiles.rectangle.enable = lib.mkEnableOption "Rectangle";

  config = lib.mkIf config.dotfiles.rectangle.enable {
    programs.rectangle = {
      enable = true;
      defaults = {
        launchOnLogin = true;
      };
    };
  };
}
