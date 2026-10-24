inputs:
{ lib, ... }:
{
  imports = [
    (import ./calibre.nix inputs)
    (import ./firefox.nix inputs)
    (import ./rectangle.nix inputs)
    (import ./signal inputs)
    ./InstantSpaceSwitcher
    ./brave.nix
    ./ghostty.nix
    ./kdeconnect
    ./keepass.nix
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
