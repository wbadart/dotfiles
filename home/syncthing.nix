{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wb.syncthing;
in
{
  options.wb.syncthing.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to disable syncthing";
    };

  config = lib.mkIf (!cfg.disable) {
    services.syncthing = {
      enable = true;
      overrideDevices = false;
      overrideFolders = false;
    };
    home.packages = with pkgs; [
      syncthing-macos
    ];
  };
}
