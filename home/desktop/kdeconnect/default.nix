{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wb.kdeconnect;
in
{
  options.wb.kdeconnect.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable KDE Connect";
    };

  config = lib.mkIf (!cfg.disable) {
    home.packages = with pkgs; [
      kdeconnect
    ];

    nixpkgs.overlays = [
      (_: _: { kdeconnect = pkgs.callPackage ./package.nix { }; })
    ];
  };
}
