let sources = import ./npins;
in
{
  pkgs ? import sources.nixpkgs (import ./npins/nixpkgs-config.nix),
  ...
}:
pkgs.mkShell {
  packages = with pkgs; [
    home-manager
    npins
  ];
}
