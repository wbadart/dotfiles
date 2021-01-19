{ ... }:
{
  imports = [
    ./desktop.nix
  ];
  networking = {
    hostName = "wb-machine";
    interfaces = {
      enp0s31f6.useDHCP = true;
      wlp4s0.useDHCP = true;
    };
  };
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.enableCryptodisk = true;
}
