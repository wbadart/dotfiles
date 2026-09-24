{
  agenix,
  home-manager,
}:
{ lib, pkgs, ... }:
{
  imports = [
    ./desktop
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
    "${agenix}/modules/age-home.nix"
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
      path = lib.mkDefault "${home-manager}";
    };
  };
}
