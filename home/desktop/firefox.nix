{ config, lib, ... }:
let
  cfg = config.wb.firefox;
in
{
  options.wb.firefox.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable Firefox browser";
    };

  config = lib.mkIf (!cfg.disable) {
    programs.firefox = {
      enable = true;
    };
  };
}
