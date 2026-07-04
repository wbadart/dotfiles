{ config, lib, pkgs, ... }:
{
  options.wb.signal.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable the Signal desktop app";
    };

  config = {
    home.packages = with pkgs; [
      signal-desktop
    ];
  };
}
