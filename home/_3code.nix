{ config, lib, pkgs, ... }:
{
  options.wb._3code = {
    enable = lib.mkEnableOption "3code";
    package = lib.mkPackageOption pkgs "_3code" { };
  };

  config =
    let
      cfg = config.wb._3code;
    in
    lib.mkIf cfg.enable {
      home.packages = [
        cfg.package
      ];
    };
}
