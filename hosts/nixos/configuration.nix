{ pkgs, lib, ... }:
{
  imports = [
    /etc/nixos/cachix.nix
    ./desktop.nix
    ./hardware-configuration.nix
  ];

  nix.settings.trusted-users = [ "root" "will" ];

  users.users.will = {
    isNormalUser = true;
    extraGroups = [ "sudo" "wheel" "networkmanager" "adbusers" "video" "libvirtd" ];
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
  programs.proxychains = {
    enable = true;
    proxies.default = {
      type = "socks4";
      host = "127.0.0.1";
      port = 9050;
    };
  };

  hardware.acpilight.enable = true;
  hardware.bluetooth.enable = true;

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.0.0.3/24" ];
      dns = [ "1.1.1.1" "1.0.0.1" ];
      privateKeyFile = "/home/will/wireguard-keys/private";
      peers = [
        {
          publicKey = "61D6QGriV+wL8R+XcfWU7IQ3sA6pHtEbRRGuRVWjkjQ=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "207.246.84.28:26969";
          persistentKeepalive = 25;
        }
      ];
    };
  };

  networking.firewall.interfaces.wg0 = {
    allowedTCPPorts = [
      22
      22000  # syncthing
    ];
    allowedTCPPortRanges = [
      { from = 8000; to = 8999; }
    ];
    allowedUDPPorts = [
      22000  # syncthing QUIC
      21027  # syncthing discovery
    ];
  };
}
