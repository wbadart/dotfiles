{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    # displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      # config = ...
    };
  };

  environment.systemPackages = with pkgs; [
    dmenu
    firefox
    # gnome3.gnome-tweak-tool
    xsel
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
