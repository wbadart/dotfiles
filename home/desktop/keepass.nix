{ config, lib, ... }:
let
  cfg = config.wb.keepass;
in
{
  options.wb.keepass.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable KeePassXC";
    };

  config = lib.mkIf (!cfg.disable) {
    programs.keepassxc = {
      enable = true;
      autostart = true;
      settings = {
        Browser = {
          Enabled = true;
          UpdateBinaryPath = false; # see man page
        };
      };
    };
  };
}
