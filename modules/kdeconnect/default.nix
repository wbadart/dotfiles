{ config, lib, pkgs, ... }:
{
  options.dotfiles.kdeconnect.enable = lib.mkEnableOption "KDE Connect";

  config = lib.mkIf config.dotfiles.kdeconnect.enable {
    home.packages = with pkgs; [
      kdeconnect
    ];

    nixpkgs.overlays = [
      (_: _: { kdeconnect = pkgs.callPackage ./package.nix { }; })
    ];
  };
}
