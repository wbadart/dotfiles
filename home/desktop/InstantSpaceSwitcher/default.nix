{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.wb.InstantSpaceSwitcher;
in
{
  options.wb.InstantSpaceSwitcher.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = config.wb.desktop.disable;
      defaultText = lib.literalExpression "config.wb.desktop.disable";
      example = true;
      description = "Whether to disable InstantSpaceSwitcher";
    };

  config = lib.mkIf (!cfg.disable) {
    home.packages = with pkgs; [
      InstantSpaceSwitcher
    ];

    nixpkgs.overlays = [
      (_: _: { InstantSpaceSwitcher = pkgs.callPackage ./package.nix { }; })
    ];
  };
}
