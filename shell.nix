let
  sources = import ./npins;
in
{
  pkgs ? import sources.nixpkgs { },
  ...
}:
let
  agenix = import sources.agenix { inherit pkgs; };
  home-manager = import sources.home-manager { inherit pkgs; };
in
pkgs.mkShell {
  packages = with pkgs; [
    agenix.agenix
    home-manager.home-manager
    npins
  ];
}
