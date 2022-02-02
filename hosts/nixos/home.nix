{ pkgs, config, ... }:
{
  imports = [
    ../../modules/hledger.nix
    ../../modules/emanote.nix
    ../../modules/neuron.nix
  ];

  home = {
    username = "will";
    homeDirectory = "/home/will";
    packages = with pkgs; [
      calibre
      chromium
      firefox
      nextcloud-client
      niv
      racket-minimal
      transmission
      signal-desktop
      unzip
    ];
    sessionVariables = {
      LEDGER_DIR = "/home/will/Documents/ledger";
      KASTEN_DIR = "/home/will/Documents/Kasten";
    };
  };

  programs.alacritty = {
    enable = true;
  };

  programs.git.userEmail = "will@willbadart.com";
  programs.git.signing.key = "B1B7F6AF530849E66D9AD057C0BFCABCFFB2398B";
  services.syncthing.enable = true;
  services.unclutter.enable = true;
  services.lorri.enable = true;
}
