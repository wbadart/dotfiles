{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pi-coding-agent
  ];

  nixpkgs.overlays = [
    (_final: prev: {
      pi-coding-agent = prev.callPackage ./package.nix {
        inherit (prev) pi-coding-agent;
      };
    })
  ];
}
