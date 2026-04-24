let
  sources = import ./npins;
in
{
  pkgs ? import sources.nixpkgs { },
  agenix ? import sources.agenix { inherit pkgs; },
  home-manager ? import sources.home-manager { inherit pkgs; },
}:
pkgs.mkShell {
  packages = [
    agenix.agenix
    home-manager.home-manager
    pkgs.npins
  ];
}
