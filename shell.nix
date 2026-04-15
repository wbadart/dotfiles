let
  sources = import ./npins;
  agenix = import sources.agenix;
in
{
  pkgs ? import sources.nixpkgs (import ./npins/nixpkgs-config.nix),
  ...
}:
pkgs.mkShell {
  packages = with pkgs; [
    (agenix { inherit pkgs; }).agenix
    home-manager
    npins
  ];
}
