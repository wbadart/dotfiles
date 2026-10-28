inputs:
{
  config,
  lib,
  pkgs,
  ...
}:
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
      _3code
      ffmpeg
    ];

    programs.home-manager = {
      enable = true;
      path = lib.mkDefault "${inputs.home-manager}";
    };

    nixpkgs.overlays = [
      (final: _: {
        stable = import inputs.nixpkgs-stable (
          lib.filterAttrs (_: v: v != null) {
            inherit (config.nixpkgs) config overlays;
          }
          // {
            inherit (pkgs.stdenvNoCC.hostPlatform) system;
          }
        );
        _3code = final.callPackage (import ../packages/_3code.nix inputs) { };
      })
    ];
  };
}
