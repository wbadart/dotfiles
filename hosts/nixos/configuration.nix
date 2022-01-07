{ pkgs, ... }:
{
  imports = [
    /etc/nixos/cachix.nix
    ./desktop.nix
    ./hardware-configuration.nix
  ];

  nix.trustedUsers = ["root" "will"];

  users.users.will = {
    isNormalUser = true;
    extraGroups = [ "sudo" "wheel" "networkmanager" "adbusers" "video" ];
    description = "Will";
    shell = pkgs.fish;
  };
  home-manager.users.will = (import ../../home.nix pkgs);

  networking.hostName = "wb-machine";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces = {
    enp0s31f6.useDHCP = true;
    wlp4s0.useDHCP = true;
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.splashImage = null;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.version = 2;
  boot.loader.timeout = 1;

  programs.gnupg.agent = {
    enable = true;
    # pinentryFlavor = "gnome3";
  };
  programs.adb.enable = true;
  programs.dconf.enable = true;
  programs.fish.enable = true;

  security.sudo.extraRules = [
    { users = [ "will" "root" ];
      commands = [{
      	command = "${pkgs.protonvpn-cli}/bin/protonvpn";
        options = [ "NOPASSWD" ];
      }];
    }
  ];
}
