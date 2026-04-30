let
  sources = import ./npins;
in
{
  pkgs ? import sources.nixpkgs { },
  agenix ? import sources.agenix { inherit pkgs; },
  home-manager ? import sources.home-manager { inherit pkgs; },
  nix-darwin ? import sources.nix-darwin {
    inherit (sources) nixpkgs;
    inherit pkgs;
  },
}:
pkgs.mkShell {
  packages = [
    agenix.agenix
    home-manager.home-manager
    nix-darwin.darwin-rebuild
    pkgs.npins
  ];
}
