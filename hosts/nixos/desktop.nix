{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "none+xmonad";
    desktopManager.gnome.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = builtins.readFile ../../modules/xmonad/xmonad.hs;
    };
  };

  environment.systemPackages = with pkgs; [
    dmenu
    firefox
    gnome3.gnome-tweak-tool
    xsel
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
