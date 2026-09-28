let
  inputs = import ./npins;
in
{
  pkgs ? import inputs.nixpkgs { },
  agenix ? import inputs.agenix { inherit pkgs; },
  home-manager ? import inputs.home-manager { inherit pkgs; },
  nix-darwin ? import inputs.nix-darwin {
    inherit (inputs) nixpkgs;
    inherit pkgs;
  },
}:
pkgs.mkShell {
  packages = [
    agenix.agenix
    home-manager.home-manager
    nix-darwin.darwin-rebuild
  ]
  ++ (with pkgs; [
    age
    npins
    (callPackage ./scripts/update-signal.nix { })
  ]);
}
