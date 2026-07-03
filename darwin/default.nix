let
  sources = import ../npins;
in
{ lib, pkgs, ... }:
{
  imports = [
    ./sshd.nix
    "${sources.home-manager}/nix-darwin"
  ];
  home-manager.backupFileExtension = lib.mkDefault ".bak";
  nix.nixPath = [ { nixpkgs = "${pkgs}"; } ];
  nix.channel.enable = false;
  nixpkgs.config.allowUnfree = lib.mkDefault true;
  security.pam.services.sudo_local.touchIdAuth = lib.mkDefault true;
}
