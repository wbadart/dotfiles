{ config, lib, pkgs, ... }:
{
  options.dotfiles.InstantSpaceSwitcher.enable = lib.mkEnableOption "InstantSpaceSwitcher";

  config = lib.mkIf config.dotfiles.InstantSpaceSwitcher.enable {
    home.packages = with pkgs; [
      InstantSpaceSwitcher
    ];

    nixpkgs.overlays = [
      (_: _: { InstantSpaceSwitcher = pkgs.callPackage ./package.nix { }; })
    ];
  };
}
