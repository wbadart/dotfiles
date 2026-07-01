{ config, lib, ... }:
{
  options.dotfiles.pi.enable = lib.mkEnableOption "pi";

  config = lib.mkIf config.dotfiles.pi.enable {
    programs.pi-coding-agent = {
      enable = true;
      configDir = "${config.xdg.configHome}/pi/agent";
    };

    programs.tmux.extraConfig = ''
      set -g extended-keys on
      set -g extended-keys-format csi-u
    '';
  };
}
