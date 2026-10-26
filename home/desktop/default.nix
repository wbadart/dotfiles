inputs:
{ lib, ... }:
{
  imports = [
    (import ./calibre.nix inputs)
    (import ./signal inputs)
    ./InstantSpaceSwitcher
    ./brave.nix
    ./firefox.nix
    ./ghostty.nix
    ./kdeconnect
    ./keepass.nix
    ./rectangle.nix
  ];

  options.wb.desktop.disable =
    let
      inherit (lib) types;
    in
    lib.mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to disable desktop-related modules";
    };
}
