let importIfExists = path: default: if builtins.pathExists path then import path else default;
in
{ pkgs, lib, ... }:
{
  imports = [
    # /etc/nixos/cachix.nix
    # ./desktop.nix
    ./sway.nix
    ./hardware-configuration.nix
    # (
    #   import /home/will/Documents/proj/nixos-router/mkRouter.nix {
    #     internalInterface = "enp0s31f6";
    #     externalInterface = "wlp4s0";
    #     dnsServers = [ "1.1.1.1" "1.0.0.1" ];
    #   }
    # )
  ];

  nix.settings.trusted-users = [ "root" "will" ];

  users.users.will = {
    isNormalUser = true;
    extraGroups = [ "audio" "sudo" "wheel" "networkmanager" "adbusers" "video" "libvirtd" "vboxusers" ];
    description = "Will";
    shell = pkgs.fish;
  };
  home-manager.users.will = (import ../../home.nix pkgs);

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  networking.hostName = "wb-machine";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces = {
    enp0s31f6.useDHCP = true;
    wlp4s0.useDHCP = true;
  };
  # networking.nameservers = [
  #   "100.100.100.100"  # TS magic dns
  #   "9.9.9.9"          # quad9
  #   "149.112.112.112"  # quad9 backup
  # ]
  # networking.search = [
  #   "tail0dae.ts.net"  # Tailnet name
  # ];

  # environment.systemPackages = with pkgs; [
  #   mullvad-vpn
  # ];
  # services.mullvad-vpn.enable = true;
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.splashImage = null;
  boot.loader.grub.useOSProber = true;
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
    # wg0 = {
    #   address = [ "10.69.0.11/32" ];
    #   dns = [ "1.1.1.1" "1.0.0.1" ];
    #   privateKeyFile = "/home/will/wireguard-keys/private";
    #   peers = importIfExists /home/will/.local/opt/infra/wg-server.nix [];
    # };
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
