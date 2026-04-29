{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pi-coding-agent
  ];

  programs.tmux.extraConfig = ''
    set -g extended-keys on
    set -g extended-keys-format csi-u
  '';

  nixpkgs.overlays = [
    (_final: prev: {
      pi-coding-agent = prev.callPackage ./package.nix {
        inherit (prev) pi-coding-agent;
      };
    })
  ];
}
