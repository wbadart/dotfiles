{ lib, ... }:
{
  imports = [
    ./InstantSpaceSwitcher
    ./ghostty.nix
    ./kdeconnect
    ./keepass.nix
    ./rectangle.nix
    ./signal
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
