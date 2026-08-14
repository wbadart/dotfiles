{ config, lib, pkgs, ... }:
let
  cfg = config.wb.brave;
in
{
  options.wb.brave.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable Brave browser";
    };

  config = lib.mkIf (!cfg.disable) {
    home.packages = with pkgs; [
      brave
    ];
  };
}
