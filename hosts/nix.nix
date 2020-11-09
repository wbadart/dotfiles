{ config, pkgs, ... }:
import /home/will/.config/nixpkgs/home.nix
{
  username = "will";
  homeDirectory = "/home/will";
  email = "will@willbadart.com";
  extraPackages = with pkgs; [
    calibre
    firefox
    signal-desktop
    tmux
  ];
  extraConfig = {
    services.syncthing.enable = true;
    services.unclutter.enable = true;
  };
}
{ config = config; pkgs = pkgs; }
