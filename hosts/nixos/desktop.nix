{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "gnome";
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    gnome3.gnome-tweaks
    xsel
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
