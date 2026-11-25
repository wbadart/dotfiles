{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.wb.herdr = {
    enable = lib.mkEnableOption "herdr";
  };

  config =
    let
      cfg = config.wb.herdr;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        herdr
      ];
    };
}
