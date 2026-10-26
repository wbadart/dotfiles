overrides:
let
  inputs = import ../npins // overrides;
in
{ config, lib, pkgs, ... }:
{
  imports = [
    (import ./desktop inputs)
    ./git.nix
    ./hledger.nix
    ./nix.nix
    ./nvim
    ./pi.nix
    ./ssh.nix
    ./syncthing.nix
    ./tmux
    ./zk
    ./zsh.nix
    "${inputs.agenix}/modules/age-home.nix"
  ];

  options.wb = {
    secrets.enable = lib.mkEnableOption "dotfiles' secrets";
  };

  config = {
    xdg.enable = true;
    xdg.autostart.enable = true;
    home.preferXdgDirectories = true;

    home.packages = with pkgs; [
      ffmpeg
    ];

    programs.home-manager = {
      enable = true;
      path = lib.mkDefault "${inputs.home-manager}";
    };

    nixpkgs.overlays = [
      (_: _: {
        stable = import inputs.nixpkgs-stable {
          inherit (config.nixpkgs) config overlays;
          system = pkgs.stdenvNoCC.hostPlatform.system;
        };
      })
    ];
  };
}
