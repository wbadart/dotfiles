{ pkgs, ... }:
import /home/will/doc/dotfiles/home.nix
{
  username = "will";
  homeDirectory = "/home/will";
  email = "will@willbadart.com";
  extraPackages = with pkgs; [
    calibre
    firefox
    signal-desktop
    tmux
    protonvpn-cli
  ];
  extraConfig = {
    services.syncthing.enable = true;
    services.unclutter.enable = true;
  };
}
{ pkgs = pkgs; }
