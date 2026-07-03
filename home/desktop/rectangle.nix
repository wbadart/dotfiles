{ config, lib, ... }:
let
  cfg = config.wb.rectangle;
in
{
  options.wb.rectangle.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable rectangle";
    };

  config = lib.mkIf (!cfg.disable) {
    programs.rectangle = {
      enable = true;
      defaults = {
        launchOnLogin = true;
      };
    };
  };
}
