{ pkgs, ... }:
let wg-port = 51820;
in {
  imports = [
    ./desktop.nix
  ];
  users.users.will.packages = with pkgs; [
    wireguard
  ];
  networking.hostName = "wb-machine";
  networking.interfaces = {
    enp0s31f6.useDHCP = true;
    wlp4s0.useDHCP = true;
  };

  networking.firewall.allowedUDPPorts = [ wg-port ];
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.100.0.6/24" ];
      dns = [ "1.1.1.1" ];
      listenPort = wg-port;
      privateKeyFile = "/home/will/wireguard-keys/private";
      peers = [
        {
          publicKey = "Cq1XjSaGaa4kL5uXKrxz+j6Y4yEjshkUVbMSlFFi3mM=";
          allowedIPs = [ "10.100.0.6/32" ];
          endpoint = "77.60.203.42:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.enableCryptodisk = true;
}
