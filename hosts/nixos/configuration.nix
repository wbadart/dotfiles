{ pkgs, ... }:
let wg-port = 51820;
in {
  imports = [
    ./desktop.nix
  ];

  nix.trustedUsers = ["root" "will"];

  services.fprintd.enable = true;
  services.fwupd.enable = true;
  # services.tailscale.enable = true;

  users.users.will.packages = with pkgs; [
    wireguard
  ];
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  networking.hostName = "wb-machine";
  networking.interfaces = {
    enp0s31f6.useDHCP = true;
    wlp4s0.useDHCP = true;
  };

  networking.firewall.allowedUDPPorts = [ wg-port ];
  networking.wg-quick.interfaces = {
    wg0 = {
      # address = [ "10.100.0.6/32" "10.0.0.2" ];
      address = [ "10.0.0.2" ];
      listenPort = wg-port;
      privateKeyFile = "/home/will/wireguard-keys/private";
      peers = [
        {
          publicKey = "Cq1XjSaGaa4kL5uXKrxz+j6Y4yEjshkUVbMSlFFi3mM=";
          allowedIPs = [ "192.168.1.0/24" ];
          endpoint = "77.60.203.42:51820";
          persistentKeepalive = 25;
        }
        # {
        #   publicKey = "eW4TFHWkh5u3ncxuBGSIRcjF7qUmevv5vWCndS6xGjw=";
        #   allowedIPs = [ "10.0.0.0/24" ];
        #   endpoint = "96.231.239.28:55350";
        #   persistentKeepalive = 25;
        # }
      ];
    };
    # wg0 = {
    #   address = [ "10.13.13.3" ];
    #   listenPort = 51820;
    #   privateKeyFile = "/home/will/vultr_priv_key";
    #   peers = [
    #     {
    #       publicKey = "BVaDgi4Cj1SjzTUQm2h1/0IVxO0yACraXOluywibXHE=";
    #       allowedIPs = [ "10.13.13.1/32" "45.77.105.50/32" ];
    #       endpoint = "45.77.105.50:51820";
    #       persistentKeepalive = 25;
    #     }
    #   ];
    # };
  };
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.enableCryptodisk = true;

  virtualisation.podman.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager kvm ];
}
