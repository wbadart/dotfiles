{ config, lib, ... }:
let
  cfg = config.wb.pi;
in
{
  options.wb.pi.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to disable pi-coding-agent";
    };

  config = lib.mkIf (!cfg.disable) {
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
